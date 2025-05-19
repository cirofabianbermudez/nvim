-- To see more options run :he option-list

-- Basic configurations
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.relativenumber = false
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.cmd("syntax enable")
vim.cmd("autocmd FileType * setlocal formatoptions-=cro")
--vim.opt.shell = "pwsh"

-- Optional for compatibility
vim.opt.compatible = false

-- Use system clipboard
-- vim.opt.clipboard = 'unnamedplus'  -- for windows
-- vim.opt.clipboard = 'unnamed'      -- for linux

-- Tabs configuration
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Custom autocomplete commands view
-- vim.opt.wildmode = "longest,list,full"

-- Fix splitting
vim.opt.splitbelow = true -- :split
vim.opt.splitright = true -- :vsplit

-- Line wrap
vim.opt.wrap = false

-- Serch configs
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Optional configurations
-- vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.updatetime = 50

-- Make macros compatible with <C-a>
vim.opt.nrformats:append("alpha")
