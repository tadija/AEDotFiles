-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-f>", "<leader>fg", { remap = true, desc = "Quick Open Files" })
vim.keymap.set("n", "<C-g>", "<leader>sG", { remap = true, desc = "Search In Files" })
