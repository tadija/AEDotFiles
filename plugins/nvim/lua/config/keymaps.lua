-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tasks = require("config.tasks")
local map = vim.keymap.set
local opts = { remap = true, silent = true }

require("which-key").add({ { "<leader>m", group = "My Tasks" }, })
map("n", "<leader>ml", function() tasks.run("lint") end, vim.tbl_extend("force", opts, { desc = "Run linter" }))
map({ "n", "v" }, "<leader>mf", function() tasks.run("format") end, vim.tbl_extend("force", opts, { desc = "Format code" }))
map("n", "<leader>mb", function() tasks.run("build") end, vim.tbl_extend("force", opts, { desc = "Build project" }))
map("n", "<leader>mt", function() tasks.run("test") end, vim.tbl_extend("force", opts, { desc = "Run tests" }))

map("n", "<leader>sk", function() require("snacks").picker.keymaps() end, { desc = "[S]earch [K]eymaps" })

map("n", "<leader>a", "ggVG", { remap = true, desc = "Select all" })
map("n", "<leader>k", "gcc", { remap = true, desc = "Toggle Comment" })
map("v", "<leader>k", "gc", { remap = true, desc = "Toggle Comment" })
