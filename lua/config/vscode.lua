-- VSCode Keymaps

-- Easy write and quit
vim.keymap.set("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>", opt)
vim.keymap.set("n", "<leader>q", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opt)

-- Move across tabs
vim.keymap.set("n", "<leader>i", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>", opt)
vim.keymap.set("n", "<leader>o", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>", opt)

-- Make macros compatible with <C-a>
vim.opt.nrformats:append("alpha")
