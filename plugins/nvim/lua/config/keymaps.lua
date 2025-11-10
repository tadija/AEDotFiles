-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tasks = require("config.tasks")
local map = vim.keymap.set
local opts = { remap = true, silent = true }

local function makeOptions(description)
  return vim.tbl_extend("force", opts, { desc = description })
end

require("which-key").add({ { "<leader>m", group = "My Tasks" }, })
map("n", "<leader>mb", function() tasks.run("build") end, makeOptions("Build project"))
map({ "n", "v" }, "<leader>mf", function() tasks.run("format") end, makeOptions("Format code"))
map("n", "<leader>ml", function() tasks.run("lint") end, makeOptions("Run linter"))
map("n", "<leader>mt", function() tasks.run("test") end, makeOptions("Run tests"))

map("n", "<leader>sk", function() require("snacks").picker.keymaps() end, { desc = "[S]earch [K]eymaps" })

map("n", "<leader>a", "ggVG", makeOptions("Select all"))
map("n", "<leader>k", "gcc", makeOptions("Toggle Comment"))
map("v", "<leader>k", "gc", makeOptions("Toggle Comment"))
