vim.keymap.set("i", "<C-k>", '[]()<left><esc>"+pF[a', { noremap = true, silent = true })

-- Windows
-- vim.keymap.set("n", "<leader>fa", [[:! start chrome "file://%:p"<CR><CR>]], { desc = "Open Markdown Preview", noremap = true, silent = true })

-- Linux
-- vim.keymap.set("n", "<leader>fa", [[:! google-chrome "file://%:p"<CR><CR>]], { desc = "Open Markdown Preview", noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>fc", [[:! code %:p<CR><CR>]], { desc = "Open in VSCode", noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>mv", "i```verilog<CR>```<ESC>O", opt)
