local hyper = { "cmd", "alt", "ctrl", "shift" }

if hs.settings.get("reload_requested") then
  hs.settings.clear("reload_requested")
  hs.alert.show("Hammerspoon reloaded")
end

local actions = require("hyperactions")
local keymaps = require("hypermaps")
require("hyperkeys").setup(hyper, actions, keymaps)
require("hyperwins").setup(hyper)

