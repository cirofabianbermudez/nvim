vim.keymap.set("i", "<C-k>", '[]()<left><esc>"+pF[a', { noremap = true })
vim.keymap.set("n", "<leader>fa", [[:! start chrome "file://%:p"<CR><CR>]], { noremap = true })
vim.keymap.set("n", "<leader>fc", [[:! code %:p"<CR><CR>]], { noremap = true })

vim.keymap.set("i", "<leader>vv", "```verilog<CR>```<ESC>O", opt)
