local M = {}

local function bindMap(map, binder)
  if not map then return end

  for key, value in pairs(map) do
    binder(key, value)
  end
end

local function resolveAction(actions, value)
  local valueType = type(value)

  if valueType == "function" then
    return value
  end

  if valueType == "table" then
    return function() actions.toggleApp(value) end
  end

  if valueType == "string" then
    return actions[value] or function() actions.toggleApp(value) end
  end

  return nil
end

local function safeRun(actions, value)
  local fn = resolveAction(actions, value)
  if fn then
    fn()
  end
end

local function bindDirect(hyper, actions, keymaps)
  bindMap(keymaps, function(key, value)
    hs.hotkey.bind(hyper, key, function()
      safeRun(actions, value)
    end)
  end)
end

local function bindModal(hyper, trigger, actions, keymaps)
  local mode = hs.hotkey.modal.new(hyper, trigger)
  mode:bind("", "escape", function() mode:exit() end)
  mode:bind("", "return", function() mode:exit() end)

  bindMap(keymaps, function(key, value)
    mode:bind("", key, function()
      safeRun(actions, value)
      mode:exit()
    end)
  end)
end

function M.setup(hyper, actions, maps)
  bindDirect(hyper, actions, maps.hyperKeymaps)
  bindModal(hyper, "space", actions, maps.hyperSpaceKeymaps)
  bindModal(hyper, "tab", actions, maps.hyperTabKeymaps)
end

return M
