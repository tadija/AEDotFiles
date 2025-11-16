-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- comment line / selection
map("n", "<leader>k", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>k", "gc", { desc = "Toggle Comment", remap = true })

-- define group for codecompanion keymaps
require("which-key").add({ { "<leader>a", group = "ai" }, })

-- extend built-in "file" keymap
map("n", "<leader>fa", "ggVG", { desc = "Select all" })
map("n", "<leader>fi", "gg=G", { desc = "Indent all" })
map("n", "<leader>fy", ":%y+<CR>", { desc = "Yank all" })
map("n", "<leader>fs", function()
  vim.cmd("silent write")
  vim.notify("Saved ✔", "info", { title = "File" })
end, { desc = "Save file" })

-- extend built-in "search" keymap
map("n", "<leader>sk", function()
  require("snacks").picker.keymaps()
end, { desc = "[S]earch [K]eymaps" })

-- resize panes in all directions
map("n", "<C-M-h>", "<Cmd>vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<C-M-l>", "<Cmd>vertical resize +2<CR>", { desc = "Resize right" })
map("n", "<C-M-j>", "<Cmd>resize +2<CR>", { desc = "Resize down" })
map("n", "<C-M-k>", "<Cmd>resize -2<CR>", { desc = "Resize up" })

-- load task keymaps (wip)
local tasks = require("config.tasks")
require("which-key").add({ { "<leader>t", group = "tasks" }, })
map("n", "<leader>tl", "<cmd>TaskLint<CR>",   { desc = "Lint" })
map("n", "<leader>tf", "<cmd>TaskFormat<CR>", { desc = "Format" })
map("n", "<leader>tb", "<cmd>TaskBuild<CR>",  { desc = "Build" })
map("n", "<leader>tt", "<cmd>TaskTest<CR>",   { desc = "Test" })
