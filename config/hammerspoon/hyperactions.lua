local M = {}

local function normalizeAppSpec(appSpec)
  if type(appSpec) == "table" then
    return appSpec
  end
  return { name = appSpec }
end

local function frontmostMatches(app, bundle, name)
  if not app then return false end
  if bundle and app:bundleID() == bundle then return true end
  if name and app:name() == name then return true end
  return false
end

-- not open: launch / inactive: focus / active: hide
function M.toggleApp(appSpec)
  local spec = normalizeAppSpec(appSpec)
  local name = spec.name
  local bundle = spec.bundle

  local app = bundle and hs.application.get(bundle) or hs.application.find(name)
  if type(app) == "table" then
    app = app[1]
  end
  if app and app.isFrontmost and app:isFrontmost() then
    local ok = app:hide()
    if ok == false and spec.fallbackHide then
      local frontmost = hs.application.frontmostApplication()
      if frontmostMatches(frontmost, bundle, name) then
        hs.eventtap.keyStroke({ "cmd" }, "h")
      end
    end
  else
    if bundle then
      hs.application.launchOrFocusByBundleID(bundle)
    else
      hs.application.launchOrFocus(name)
    end
  end
end

function M.toggleMute()
  local dev = hs.audiodevice.defaultOutputDevice()
  dev:setMuted(not dev:muted())
  hs.alert.show(dev:muted() and "Muted" or "Unmuted")
end

function M.toggleDarkMode()
  hs.applescript.applescript('tell application "System Events" to tell appearance preferences to set dark mode to not dark mode')
end

function M.toggleEmojiPicker()
  hs.eventtap.keyStroke({ "ctrl", "cmd" }, "space")
end

function M.reloadHammerspoon()
  hs.settings.set("reload_requested", true)
  hs.reload()
end

function M.hideAllApps(exceptApp)
  for _, app in ipairs(hs.application.runningApplications()) do
    if app ~= exceptApp then
      local ok = app:hide()
      if ok == false and app == hs.application.frontmostApplication() then
        hs.eventtap.keyStroke({ "cmd" }, "h")
      end
    end
  end
end

function M.quitAllApps()
  local result = hs.dialog.blockAlert("Quit All Apps", "Quit all user apps?", "Quit All", "Cancel")
  if result ~= "Quit All" then return end

  local exclude = {
    ["org.hammerspoon.Hammerspoon"] = true,
    ["org.pqrs.Karabiner-Elements"] = true,
  }

  local forceKill = {
    ["com.mitchellh.ghostty"] = true,
  }

  for _, app in ipairs(hs.application.runningApplications()) do
    local bundle = app:bundleID()
    local kind = app:kind()
    local isRegular = (kind == 1) or (kind == "regular")
    if bundle and not exclude[bundle] and isRegular then
      if forceKill[bundle] then
        app:kill9()
      else
        app:kill()
      end
    end
  end
end

return M

