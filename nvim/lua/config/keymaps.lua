-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<esc>", { desc = "Escape insert mode" })
map("i", "<C-l>", "<Right>", { remap = true })
map("i", "<C-h>", "<Left>", { remap = true })
map("n", "<C-a>", ":%y<CR>", { noremap = true, silent = false, desc = "Copy all" })
