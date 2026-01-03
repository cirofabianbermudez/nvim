-- Set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options when running macros and remaps
local opts = { noremap = true, silent = true }

-- Easy yank all or delete all
vim.keymap.set("n", "Y", "y$", { desc = "Yank till EOL", noremap = true, silent = true })

-- See file current path
vim.keymap.set("n", "<leader>?", ":echo expand('%:p')<CR>", opt)

--  Normal tab function
vim.keymap.set("x", "<Tab>", ">",   opts )
vim.keymap.set("x", "<S-Tab>", "<", opts )

-- Move with indexing included
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts )

-- Append with with cursor not moving
vim.keymap.set("n", "J", "mzJ`z", opts )

-- Move up and down keeping the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts )
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts )

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv", opts )
vim.keymap.set("n", "N", "Nzzzv", opts )

-- Paste without losing the content of the register
vim.keymap.set("x", "<leader>P", '"_dP', opts )

-- Delete without saving the content of the register
vim.keymap.set("n", "<leader>d", '"_d', {desc = "Delete to void (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>d", '"_d', {desc = "Delete to void (v)", noremap = true, silent = true })
vim.keymap.set("n", "<leader>D", '"+d', {desc = "Delete to system clipboard (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>D", '"+d', {desc = "Delete to system clipboard (v)", noremap = true, silent = true })

-- Save to system clipboard registers "+ or "*  to copy "+y   to paste "+p
vim.keymap.set("n", "<leader>y", '"+y', {desc = "Yank to system clipboard (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', {desc = "Yank to system clipboard (v)", noremap = true, silent = true })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', {desc = "Paste from system clipboard (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', {desc = "Paste from system clipboard (v)", noremap = true, silent = true })
