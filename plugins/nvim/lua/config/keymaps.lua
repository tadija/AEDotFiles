-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", "ggVG", { remap = true, desc = "Select all" })

vim.keymap.set("n", "<leader>k", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>k", "gc", { remap = true, desc = "Toggle Comment" })

vim.keymap.set("n", "<leader>i", "==", { remap = true, desc = "Re-indent" })
vim.keymap.set("v", "<leader>i", "gq", { remap = true, desc = "Re-indent" })

vim.keymap.set("n", "<leader>sk", function()
  require("snacks").picker.keymaps()
end, { desc = "[S]earch [K]eymaps" })

-- delete and change without yanking
local opts = { noremap = true, silent = true, desc = "No-yank variant" }
vim.keymap.set("n", "x",  '"_x',  opts)
vim.keymap.set("n", "X",  '"_X',  opts)
vim.keymap.set("n", "dd", '"_dd', opts)
vim.keymap.set("n", "D",  '"_D',  opts)
vim.keymap.set("n", "c",  '"_c',  opts)
vim.keymap.set("n", "cc", '"_cc', opts)
vim.keymap.set("n", "C",  '"_C',  opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "c", '"_c', opts)

