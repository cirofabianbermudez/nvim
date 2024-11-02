-- Set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options when running macros and remaps
local opts = { noremap = true, silent = true }

-- Easy write and quit
vim.keymap.set("n", "<leader>w", ":w<CR>",  { desc = "Save File",      noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>",  { desc = "Quit Neovim",    noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":q!<CR>",  { desc = "Quit Neovim",    noremap = true, silent = true })
--vim.keymap.set("n", "<leader>W", ":wa<CR>", { desc = "Save all Files", noremap = true, silent = true })

-- Easy yank all or delete all
vim.keymap.set("n", "<leader>ya", ":%y+<CR>",      { desc = "Yank All",        noremap = true, silent = true })
vim.keymap.set("n", "<leader>yd", ":%y+ | %d<CR>", { desc = "Yank All/Delete", noremap = true, silent = true })
vim.keymap.set("n", "Y", "y$",                     { desc = "Yank till EOL",   noremap = true, silent = true })
vim.keymap.set("n", "<leader>yl", '_v$<left>"+y',  { desc = "Yank line NCR",   noremap = true, silent = true }) 

-- tmux-navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts )
vim.keymap.set("n", "<C-j>", "<C-w>j", opts )
vim.keymap.set("n", "<C-k>", "<C-w>k", opts )
vim.keymap.set("n", "<C-l>", "<C-w>l", opts )

-- Easy motion if wrap lines
vim.keymap.set("n", "<A-j>", "gj", opts )
vim.keymap.set("n", "<A-k>", "gk", opts )
vim.keymap.set("n", "<A-h>", "h",  opts )
vim.keymap.set("n", "<A-l>", "l",  opts )

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Reload files
vim.keymap.set("n", "<leader>0", ":e | :echo expand('%:p')<CR>",         { desc= "Reload file",         noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":!start explorer /select,%:p<CR><CR>", { desc = "Open File Explorer" ,noremap = true, silent = true })

-- Open terminal
vim.keymap.set("n", "<leader>;", ":! wt -d " .. vim.fn.expand("%:p:h") .. "<CR><CR>", { desc = "Open Terminal" ,noremap = true, silent = true })

-- See file current path
-- vim.keymap.set("n", "<leader>?", ":echo expand('%:p')<CR>", opt)

-- Easy move between buffers
-- vim.keymap.set("n", "<leader>o", ":bn<CR>")
-- vim.keymap.set("n", "<leader>i", ":bp<CR>")
-- vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- Easy move between tabs
-- vim.keymap.set("n", "<leader>O", ":tabnext<CR>")
-- vim.keymap.set("n", "<leader>I", ":tabprevious<CR>")

--  Normal tab function
vim.keymap.set("x", "<Tab>", ">",   opts )
vim.keymap.set("x", "<S-Tab>", "<", opts )

-- Solve lack of < > keys in spanish keyboard
-- vim.keymap.set("i", "<C-j>", "<", opt)
-- vim.keymap.set("i", "<C-l>", ">", opt)

-- Toggle line wrap
vim.keymap.set("n", "<leader>ew", ":set wrap!<CR>", { desc = "Toggle Wrap" ,noremap = true, silent = true })

-- Toggle relative numbers
vim.keymap.set("n", "<leader>er", ":set relativenumber!<CR>", { desc = "Toggle Relative Numbers", noremap = true, silent = true })

-- Enable/Disable Auto-comments,  check nvim/after/ftplugin/format.lua
local comments_on = false
function Toggle_comments()
	if not comments_on then
		print("Auto-comments enable.")
		vim.cmd("setlocal formatoptions=cro")
	else
		print("Auto-comments disable.")
		vim.cmd("setlocal formatoptions-=cro")
	end
	comments_on = not comments_on
end

vim.api.nvim_set_keymap("n", "<leader>ec", "<cmd>lua Toggle_comments()<cr>", { desc = "Toggle Auto-Comments", noremap = true, silent = true })

-- Show hidden characters
vim.cmd("set listchars=tab:>-,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»")
local hidden_on = false
function Toggle_hidden()
	if not hidden_on then
		print("Hidden characters enable.")
		vim.cmd("set list")
	else
		print("Hidden characters disable.")
		vim.cmd("set list!")
	end
	hidden_on = not hidden_on
end

vim.api.nvim_set_keymap("n", "<leader>eh", "<cmd>lua Toggle_hidden()<CR>", { desc = "Toggle Hidden Chars", noremap = true, silent = true })

-- Spell check        z=
local spell_on = false
function Toggle_spell()
	if not spell_on then
		print("Spellcheck enable English. For spanish use setlocal spelllang=es")
		vim.cmd("setlocal spell spelllang=en_us")
	else
		print("Spellcheck disable.")
		vim.cmd("setlocal nospell")
	end
	spell_on = not spell_on
end

vim.api.nvim_set_keymap("n", "<leader>es", "<cmd>lua Toggle_spell()<CR>", {desc = "Toogle Spell Check", noremap = true, silent = true })

-- ===========================
--    ThePrimeagen Keymaps
-- ===========================

-- To use built-in vim explorer
vim.keymap.set("n", "<leader>nn", vim.cmd.Ex,                        {desc = "Open Netrw",       noremap = true, silent = true })
vim.keymap.set("n", "<leader>nm", ":Lex<CR>:vertical resize 30<CR>", {desc = "Open Netrw Split", noremap = true, silent = true })

-- Move with indexing included
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts )

-- Append with with cursos not moving
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

-- Save to system clipboard registers "+ or "*  to copy "+y   to paste "+p
vim.keymap.set("n", "<leader>y", '"+y', {desc = "Yank to system clipboard (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', {desc = "Yank to system clipboard (v)", noremap = true, silent = true })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', {desc = "Paste from system clipboard (n)", noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', {desc = "Paste from system clipboard (v)", noremap = true, silent = true })

-- Replace shortcut  i ignore case  I case sensitive   c ask for confirmation
vim.keymap.set("n", "<leader>ra", ":%s//gci<left><left><left><left>", {desc = "Replace asking" })
vim.keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Replace in the entire file "})

-- Harpoon like movement mark with mQ mW mE mR mT
-- vim.keymap.set("n", "<leader>1", "'Q", opt)
-- vim.keymap.set("n", "<leader>2", "'W", opt)
-- vim.keymap.set("n", "<leader>3", "'E", opt)
-- vim.keymap.set("n", "<leader>4", "'R", opt)
-- vim.keymap.set("n", "<leader>5", "'T", opt)

-- Fast mask
-- vim.keymap.set("n", "<C-m>", "mA", opt)

-- Open init.lua 'V read about vim marks for more reference
-- mV to mark

-- Disable keymap
-- :lua require('cmp').setup.buffer { enabled = false }
-- :LspStop

-- relative path
-- :let @+ = expand("%")

-- full path
-- :let @+ = expand("%:p")

-- just filename
-- :let @+ = expand("%:t")

-- :set ff=unix
-- :set ff=dos

-- Spell commands
-- z= Opens suggestion
-- zg Add word to dictionary
-- zug Remove word from the dictionary
-- zw add to the wrong dictionary
-- zuw remove to the wrong dictionary
-- ]s move to next wrong spell word

