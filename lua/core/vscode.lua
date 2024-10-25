-- Set leader key to <Space>
vim.g.mapleader = " "

-- Options when running macros and remaps
local opt = { noremap = true, silent = true }

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
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opt)
vim.keymap.set("n", "<leader>fs", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opt)
vim.keymap.set("n", "<leader>fv", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opt)
vim.keymap.set("n", "<leader>fp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", opt)
vim.keymap.set("n", "<leader>f/", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", opt)
vim.keymap.set("n", "<leader>fm", "<cmd>lua require('vscode').action('markdown.showPreview')<CR>", opt)
vim.keymap.set("n", "<leader>fn", "<cmd>lua require('vscode').action('markdown.showPreviewToSide')<CR>", opt)
vim.keymap.set("n", "<leader>f.", "<cmd>lua require('vscode').action('markdown.preview.refresh')<CR>", opt)
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", opt)

-- Markdown
vim.keymap.set("i", "<C-k>", '[]()<left><esc>"+pF[a', { noremap = true })
vim.keymap.set("n", "<leader>fa", [[:! start chrome "file://%:p"<CR><CR>]], { noremap = true })
vim.keymap.set("n", "<leader>fc", [[:! code %:p"<CR><CR>]], { noremap = true })

--  Normal tab function
vim.keymap.set("x", "<Tab>", ">", opt)
vim.keymap.set("x", "<S-Tab>", "<", opt)

-- Save to system clipboard registers "+ or "*  to copy "+y   to paste "+p
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

-- Paste without losing the content of the register
vim.keymap.set("x", "<leader>P", '"_dP', opt)

-- Delete without saving the content of the register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Reload files
vim.keymap.set("n", "<leader>0", "<cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>", opt)
vim.keymap.set("n", "<leader>h", ":!start explorer /select,%:p<CR><CR>", opt)

-- Move with indexing included
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opt)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opt)

-- Append with with cursos not moving
vim.keymap.set("n", "J", "mzJ`z", opt)

-- Move up and down keeping the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", opt)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opt)

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv", opt)
vim.keymap.set("n", "N", "Nzzzv", opt)

-- See file current path
vim.keymap.set("n", "<leader>?", ":echo expand('%:p')<CR>", opt)

-- Easy yank all or delete all
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", opt)
vim.keymap.set("n", "<leader>da", ":%y+ | %d<CR>", opt)
vim.keymap.set("n", "Y", "y$", opt)
vim.keymap.set("n", "<leader>Y", '_v$<left>"+y')

-- Replace shortcut
vim.keymap.set("n", "<leader>s", "<cmd>lua require('vscode').action('editor.action.startFindReplaceAction')<CR>", opt)
vim.keymap.set("n", "<leader>S", "<cmd>lua require('vscode').action('workbench.action.replaceInFiles')<CR>", opt)

-- Make macros compatible with <C-a>
vim.opt.nrformats:append("alpha")
