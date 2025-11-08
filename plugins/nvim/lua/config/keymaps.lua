-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", "ggVG", { remap = true, desc = "Select all" })

vim.keymap.set("n", "<leader>k", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>k", "gc", { remap = true, desc = "Toggle Comment" })

vim.keymap.set("n", "<leader>sk", function()
  require("snacks").picker.keymaps()
end, { desc = "[S]earch [K]eymaps" })

