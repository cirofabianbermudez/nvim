-- To see more options run :he option-list

-- UI configurations
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

-- Syntax configurations
vim.cmd("syntax enable")

-- Shell configurations
--vim.opt.shell = "pwsh"

-- Mouse configurations
vim.opt.mouse = "a"

-- Encoding configurations
vim.opt.encoding = "utf-8"

-- Compatibility configurations
vim.opt.compatible = false

-- Clipboard configurations
-- vim.opt.clipboard = 'unnamedplus'  -- for windows/macOS
-- vim.opt.clipboard = 'unnamed'      -- for linux

-- Tabs configurations
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Fix splitting
vim.opt.splitbelow = true -- :split
vim.opt.splitright = true -- :vsplit

-- Search configurations
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Performance configurations
vim.opt.updatetime = 50

-- Macros configurations
vim.opt.nrformats:append("alpha")

