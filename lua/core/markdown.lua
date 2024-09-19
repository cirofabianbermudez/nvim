vim.keymap.set("i", "<C-k>", '[]()<left><esc>"+pF[a', { noremap = true })
vim.keymap.set("n", "<leader>fa", [[:! start chrome "file://%:p"<CR>]], { noremap = true })
