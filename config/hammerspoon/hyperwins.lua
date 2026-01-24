local M = {}

-- hyper + numbers / arrows / return / home / end / -=[]\;'
function M.setup(hyper)
  local layout = {
    padding = 24,
    sizeKeys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" },
    windowSizeKeymaps = {
      ["1"] = { x = 0, y = 0, w = 3 / 20, h = 1 },
      ["2"] = { x = 0, y = 0, w = 1 / 5, h = 1 },
      ["3"] = { x = 0, y = 0, w = 1 / 4, h = 1 },
      ["4"] = { x = 0, y = 0, w = 1 / 3, h = 1 },
      ["5"] = { x = 0, y = 0, w = 1 / 2, h = 1 },
      ["6"] = { x = 0, y = 0, w = 2 / 3, h = 1 },
      ["7"] = { x = 0, y = 0, w = 3 / 4, h = 1 },
      ["8"] = { x = 0, y = 0, w = 4 / 5, h = 1 },
      ["9"] = { x = 0, y = 0, w = 9 / 10, h = 1 },
      ["0"] = { x = 0, y = 0, w = 1, h = 1 },
    },
    lastSizeKey = nil,
    lastSizeWinKey = nil,
    popFrameByWinKey = {},
    horizontalSlots = {
      ["1"] = {
        { x = 0, w = 3 / 20 },
        { x = 17 / 100, w = 3 / 20 },
        { x = 17 / 50, w = 3 / 20 },
        { x = 51 / 100, w = 3 / 20 },
        { x = 17 / 25, w = 3 / 20 },
        { x = 17 / 20, w = 3 / 20 },
      },
      ["2"] = {
        { x = 0, w = 1 / 5 },
        { x = 1 / 5, w = 1 / 5 },
        { x = 2 / 5, w = 1 / 5 },
        { x = 3 / 5, w = 1 / 5 },
        { x = 4 / 5, w = 1 / 5 },
      },
      ["3"] = {
        { x = 0, w = 1 / 4 },
        { x = 1 / 4, w = 1 / 4 },
        { x = 1 / 2, w = 1 / 4 },
        { x = 3 / 4, w = 1 / 4 },
      },
      ["4"] = {
        { x = 0, w = 1 / 3 },
        { x = 1 / 3, w = 1 / 3 },
        { x = 2 / 3, w = 1 / 3 },
      },
      ["5"] = {
        { x = 0, w = 1 / 2 },
        { x = 1 / 2, w = 1 / 2 },
      },
      ["6"] = {
        { x = 0, w = 2 / 3 },
        { x = 1 / 3, w = 2 / 3 },
      },
      ["7"] = {
        { x = 0, w = 3 / 4 },
        { x = 1 / 4, w = 3 / 4 },
      },
      ["8"] = {
        { x = 0, w = 4 / 5 },
        { x = 1 / 5, w = 4 / 5 },
      },
      ["9"] = {
        { x = 0, w = 9 / 10 },
        { x = 1 / 10, w = 9 / 10 },
      },
      ["0"] = {
        { x = 0, w = 1 },
      },
    },
    verticalSlots = {
      { y = 0, h = 1 },
      { y = 0, h = 0.5 },
    },
  }

  local function withFocusedWindow(fn)
    local win = hs.window.focusedWindow()
    if not win then return end
    fn(win)
  end

  local function windowKey(win)
    local app = win:application()
    local pid = app and app:pid() or 0
    local bundle = app and app:bundleID() or "unknown"
    local title = win:title() or ""
    local role = win:role() or ""
    local subrole = win:subrole() or ""
    return table.concat({ tostring(pid), bundle, title, role, subrole }, "::")
  end

  local function unitToFrame(unit, screenFrame)
    local leftInset = (unit.x <= 0) and layout.padding or layout.padding / 2
    local topInset = (unit.y <= 0) and layout.padding or layout.padding / 2
    local rightInset = ((unit.x + unit.w) >= 1) and layout.padding or layout.padding / 2
    local bottomInset = ((unit.y + unit.h) >= 1) and layout.padding or layout.padding / 2

    return {
      x = screenFrame.x + unit.x * screenFrame.w + leftInset,
      y = screenFrame.y + unit.y * screenFrame.h + topInset,
      w = math.max(unit.w * screenFrame.w - leftInset - rightInset, 0),
      h = math.max(unit.h * screenFrame.h - topInset - bottomInset, 0),
    }
  end

  local function moveFocusedWindow(unit)
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = unitToFrame(unit, screenFrame)
      win:setFrame(frame)
    end)
  end

  local function closestHorizontalSlot(frame, screenFrame)
    local bestGroup, bestGroupWidth = layout.sizeKeys[1], math.huge
    for _, groupName in ipairs(layout.sizeKeys) do
      local slots = layout.horizontalSlots[groupName]
      local groupBestWidth = math.huge
      for _, slot in ipairs(slots) do
        local target = unitToFrame({ x = slot.x, y = 0, w = slot.w, h = 1 }, screenFrame)
        local widthScore = math.abs(frame.w - target.w)
        if widthScore < groupBestWidth then
          groupBestWidth = widthScore
        end
      end
      if groupBestWidth < bestGroupWidth then
        bestGroupWidth = groupBestWidth
        bestGroup = groupName
      end
    end

    local bestIndex, bestPos = 1, math.huge
    for i, slot in ipairs(layout.horizontalSlots[bestGroup]) do
      local target = unitToFrame({ x = slot.x, y = 0, w = slot.w, h = 1 }, screenFrame)
      local posScore = math.abs(frame.x - target.x)
      if posScore < bestPos then
        bestPos = posScore
        bestIndex = i
      end
    end
    return bestGroup, bestIndex
  end

  local function closestSlotIndexForSlots(centerX, slots)
    local bestIndex, bestScore = 1, math.huge
    for i, slot in ipairs(slots) do
      local slotCenter = slot.x + slot.w / 2
      local score = math.abs(centerX - slotCenter)
      if score < bestScore then
        bestScore = score
        bestIndex = i
      end
    end
    return bestIndex
  end

  local function closestVerticalMode(frame, screenFrame)
    local bestMode, bestScore = layout.verticalSlots[1], math.huge
    for _, mode in ipairs(layout.verticalSlots) do
      local target = unitToFrame({ x = 0, y = mode.y, w = 1, h = mode.h }, screenFrame)
      local score = math.abs(frame.y - target.y) + math.abs(frame.h - target.h)
      if score < bestScore then
        bestScore = score
        bestMode = mode
      end
    end
    return bestMode
  end

  local function closestVerticalSlot(frame, screenFrame)
    local slots = {
      { y = 0, h = 0.5 },
      { y = 0.5, h = 0.5 },
    }
    local bestIndex, bestScore = 1, math.huge
    for i, slot in ipairs(slots) do
      local target = unitToFrame({ x = 0, y = slot.y, w = 1, h = slot.h }, screenFrame)
      local score = math.abs(frame.y - target.y) + math.abs(frame.h - target.h)
      if score < bestScore then
        bestScore = score
        bestIndex = i
      end
    end
    return slots, bestIndex
  end

  local function makeWindowCycler()
    local lastCycleIds = nil
    local lastCycleIndex = nil

    local function windowIdsInCurrentSpace()
      local ordered = hs.window.orderedWindows() or {}
      local result = {}
      for _, win in ipairs(ordered) do
        if win:isVisible() and not win:isMinimized() then
          table.insert(result, win:id())
        end
      end
      return result
    end

    return function(delta)
      local ids = windowIdsInCurrentSpace()
      if #ids < 2 then return end

      local current = hs.window.focusedWindow()
      local currentId = current and current:id() or nil
      local reset = (not lastCycleIds)
      if not reset and currentId then
        local found = false
        for _, id in ipairs(lastCycleIds) do
          if id == currentId then
            found = true
            break
          end
        end
        if not found then
          reset = true
        end
      end

      if reset then
        lastCycleIds = ids
        lastCycleIndex = 1
        if currentId then
          for i, id in ipairs(lastCycleIds) do
            if id == currentId then
              lastCycleIndex = i
              break
            end
          end
        end
      end

      local nextIndex = ((lastCycleIndex - 1 + delta) % #lastCycleIds) + 1
      local nextWin = hs.window.get(lastCycleIds[nextIndex])
      if nextWin then
        nextWin:focus()
      end

      lastCycleIndex = nextIndex
    end
  end

  local function switchHorizontalMode(delta)
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = win:frame()
      local currentMode = closestHorizontalSlot(frame, screenFrame)
      local currentIndex = 1
      for i, key in ipairs(layout.sizeKeys) do
        if key == currentMode then
          currentIndex = i
          break
        end
      end

      local nextIndex = ((currentIndex - 1 + delta) % #layout.sizeKeys) + 1
      local nextMode = layout.sizeKeys[nextIndex]
      local centerX = (frame.x + frame.w / 2 - screenFrame.x) / screenFrame.w
      local slots = layout.horizontalSlots[nextMode]
      local slotIndex = closestSlotIndexForSlots(centerX, slots)
      local vMode = closestVerticalMode(frame, screenFrame)

      moveFocusedWindow({
        x = slots[slotIndex].x,
        y = vMode.y,
        w = slots[slotIndex].w,
        h = vMode.h,
      })
    end)
  end

  local function nudgeHorizontalSlot(delta)
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = win:frame()
      local groupName, index = closestHorizontalSlot(frame, screenFrame)
      local slots = layout.horizontalSlots[groupName]
      local nextIndex = ((index - 1 + delta) % #slots) + 1
      local mode = closestVerticalMode(frame, screenFrame)

      moveFocusedWindow({
        x = slots[nextIndex].x,
        y = mode.y,
        w = slots[nextIndex].w,
        h = mode.h,
      })
    end)
  end

  local function switchVerticalMode(delta)
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = win:frame()
      local groupName, index = closestHorizontalSlot(frame, screenFrame)
      local slots = layout.horizontalSlots[groupName]
      local currentMode = closestVerticalMode(frame, screenFrame)
      local currentIndex = 1
      for i, mode in ipairs(layout.verticalSlots) do
        if mode.y == currentMode.y and mode.h == currentMode.h then
          currentIndex = i
          break
        end
      end
      local nextIndex = ((currentIndex - 1 + delta) % #layout.verticalSlots) + 1
      local mode = layout.verticalSlots[nextIndex]
      local target = unitToFrame({
        x = slots[index].x,
        y = mode.y,
        w = slots[index].w,
        h = mode.h,
      }, screenFrame)
      local minY = screenFrame.y + layout.padding
      local maxY = screenFrame.y + screenFrame.h - layout.padding - target.h
      local newY = math.min(math.max(frame.y, minY), maxY)

      win:setFrame({
        x = target.x,
        y = newY,
        w = target.w,
        h = target.h,
      })
    end)
  end

  local function nudgeVerticalSlot(delta)
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = win:frame()
      local groupName, index = closestHorizontalSlot(frame, screenFrame)
      local slots = layout.horizontalSlots[groupName]
      local verticalSlots, vIndex = closestVerticalSlot(frame, screenFrame)
      local nextIndex = ((vIndex - 1 + delta) % #verticalSlots) + 1

      moveFocusedWindow({
        x = slots[index].x,
        y = verticalSlots[nextIndex].y,
        w = slots[index].w,
        h = verticalSlots[nextIndex].h,
      })
    end)
  end

  local function centerFocusedWindow()
    withFocusedWindow(function(win)
      local screenFrame = win:screen():frame()
      local frame = win:frame()
      local minX = screenFrame.x + layout.padding
      local minY = screenFrame.y + layout.padding
      local maxX = screenFrame.x + screenFrame.w - layout.padding - frame.w
      local maxY = screenFrame.y + screenFrame.h - layout.padding - frame.h

      win:setFrame({
        x = math.min(math.max(screenFrame.x + (screenFrame.w - frame.w) / 2, minX), maxX),
        y = math.min(math.max(screenFrame.y + (screenFrame.h - frame.h) / 2, minY), maxY),
        w = frame.w,
        h = frame.h,
      })
    end)
  end

  local function togglePopFocusedWindow()
    withFocusedWindow(function(win)
      local winKey = windowKey(win)
      local existingFrame = layout.popFrameByWinKey[winKey]
      if existingFrame then
        win:setFrame(existingFrame)
        layout.popFrameByWinKey[winKey] = nil
        return
      end

      layout.popFrameByWinKey[winKey] = win:frame()
      local screenFrame = win:screen():frame()
      local popFrame = unitToFrame({ x = 1 / 8, y = 1 / 8, w = 3 / 4, h = 3 / 4 }, screenFrame)
      win:setFrame(popFrame)
    end)
  end

  local function buildKeymaps()
    local cycleWindowInCurrentSpace = makeWindowCycler()
    local moveKeymaps = {}
    for key, unit in pairs(layout.windowSizeKeymaps) do
      moveKeymaps[key] = function()
        withFocusedWindow(function(win)
          local slots = layout.horizontalSlots[key]
          local winKey = windowKey(win)
          local isRepeat = (layout.lastSizeKey == key and layout.lastSizeWinKey == winKey)
          local screenFrame = win:screen():frame()
          local frame = win:frame()
          local centerX = (frame.x + frame.w / 2 - screenFrame.x) / screenFrame.w
          local currentIndex = closestSlotIndexForSlots(centerX, slots)
          local targetIndex = currentIndex
          if isRepeat then
            targetIndex = (currentIndex % #slots) + 1
          end

          layout.lastSizeKey = key
          layout.lastSizeWinKey = winKey
          moveFocusedWindow({
            x = slots[targetIndex].x,
            y = unit.y,
            w = slots[targetIndex].w,
            h = unit.h,
          })
        end)
      end
    end

    local actionKeymaps = {
      left = function() nudgeHorizontalSlot(-1) end,
      right = function() nudgeHorizontalSlot(1) end,
      up = function() nudgeVerticalSlot(-1) end,
      down = function() nudgeVerticalSlot(1) end,
      ["-"] = function() switchHorizontalMode(-1) end,
      ["="] = function() switchHorizontalMode(1) end,
      ["["] = function() cycleWindowInCurrentSpace(-1) end,
      ["]"] = function() cycleWindowInCurrentSpace(1) end,
      ["\\"] = function() centerFocusedWindow() end,
      [";"] = function() switchVerticalMode(-1) end,
      ["'"] = function() switchVerticalMode(1) end,
      ["return"] = function() togglePopFocusedWindow() end,
      ["home"] = function() hs.spaces.toggleShowDesktop() end,
      ["end"] = function() hs.spaces.toggleMissionControl() end,
    }

    return moveKeymaps, actionKeymaps
  end

  local function bindHotkeys(map)
    for key, fn in pairs(map) do
      hs.hotkey.bind(hyper, key, function()
        fn()
      end)
    end
  end

  local moveKeymaps, actionKeymaps = buildKeymaps()
  bindHotkeys(moveKeymaps)
  bindHotkeys(actionKeymaps)
end

return M

