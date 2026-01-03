-- VSCode Keymaps

-- Easy write and quit
vim.keymap.set("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>", opt)
vim.keymap.set("n", "<leader>q", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opt)

-- Move across tabs
vim.keymap.set("n", "<leader>i", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>", opt)
vim.keymap.set("n", "<leader>o", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>", opt)

-- Telescope like
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opt)
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>", opt)

-- VSCode
-- vim.keymap.set("n", "<leader>fb", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opt)
-- vim.keymap.set("n", "<leader>fs", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opt)
-- vim.keymap.set("n", "<leader>fv", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opt)
-- vim.keymap.set("n", "<leader>fp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", opt)
-- vim.keymap.set("n", "<leader>f/", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", opt)
-- vim.keymap.set("n", "<leader>fm", "<cmd>lua require('vscode').action('markdown.showPreview')<CR>", opt)
-- vim.keymap.set("n", "<leader>fn", "<cmd>lua require('vscode').action('markdown.showPreviewToSide')<CR>", opt)
-- vim.keymap.set("n", "<leader>f.", "<cmd>lua require('vscode').action('markdown.preview.refresh')<CR>", opt)
-- vim.keymap.set("n", "<leader>ft", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", opt)

-- Make macros compatible with <C-a>
vim.opt.nrformats:append("alpha")
