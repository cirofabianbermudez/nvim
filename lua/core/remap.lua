-- Set leader key to <Space>
vim.g.mapleader = " "

-- Options when running macros and remaps
local opt = { noremap = true }
-- local opt = { noremap = true, silent = true }

-- Easy write and quit
vim.keymap.set("n", "<leader>w", ":w<CR>", opt)
vim.keymap.set("n", "<leader>q", ":q<CR>", opt)
vim.keymap.set("n", "<leader>W", ":wa<CR>", opt)

-- Easy yank all or delete all
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", opt)
vim.keymap.set("n", "<leader>da", ":%y+ | %d<CR>", opt)
vim.keymap.set("n", "Y", "y$", opt)
vim.keymap.set("n", "<leader>Y", '_v$<left>"+y')

-- tmux-navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)

-- Easy motion if wrap lines
vim.keymap.set("n", "<A-j>", "gj", opt)
vim.keymap.set("n", "<A-k>", "gk", opt)
vim.keymap.set("n", "<A-h>", "h", opt)
vim.keymap.set("n", "<A-l>", "l", opt)

-- Reload files
vim.keymap.set("n", "<leader>0", ":e | :echo expand('%:p')<CR>", opt)
vim.keymap.set("n", "<leader>h", ":!start explorer /select,%:p<CR><CR>", { silent = true })

-- See file current path
vim.keymap.set("n", "<leader>?", ":echo expand('%:p')<CR>", opt)

-- Easy move between buffers
vim.keymap.set("n", "<leader>o", ":bn<CR>")
vim.keymap.set("n", "<leader>i", ":bp<CR>")
vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- Easy move between tabs
vim.keymap.set("n", "<leader>O", ":tabnext<CR>")
vim.keymap.set("n", "<leader>I", ":tabprevious<CR>")

--  Normal tab function
vim.keymap.set("x", "<Tab>", ">", opt)
vim.keymap.set("x", "<S-Tab>", "<", opt)

-- Solve lack of < > keys in spanish keyboard
vim.keymap.set("i", "<C-j>", "<", opt)
vim.keymap.set("i", "<C-l>", ">", opt)

-- Toggle line wrap
vim.keymap.set("n", "<leader>ew", ":set wrap!<CR>", opt)

-- Toggle relative numbers
vim.keymap.set("n", "<leader>er", ":set relativenumber!<CR>", opt)

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

vim.api.nvim_set_keymap("n", "<leader>ec", "<cmd>lua Toggle_comments()<cr>", opt)
--vim.keymap.set('n', '<leader>dc', ':setlocal formatoptions-=cro<CR>', opt)
--vim.keymap.set('n', '<leader>ec', ':setlocal formatoptions=cro<CR>', opt)

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

vim.api.nvim_set_keymap("n", "<leader>eh", "<cmd>lua Toggle_hidden()<CR>", opt)
--vim.keymap.set('n', '<F9>', ":set listchars=tab:>-,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»<CR>:set list<CR>" , opt)
--vim.keymap.set('n', '<F10>', ":set list!<CR>" , opt)

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

vim.api.nvim_set_keymap("n", "<leader>es", "<cmd>lua Toggle_spell()<CR>", opt)
--vim.keymap.set('n', '<leader>es', ':setlocal spell spelllang=es<CR>', opt)
--vim.keymap.set('n', '<leader>ds', ':setlocal nospell<CR>', opt)

-- ===========================
--    ThePrimeagen Keymaps
-- ===========================

-- To use built-in vim explorer
vim.keymap.set("n", "<leader>nn", vim.cmd.Ex)
vim.keymap.set("n", "<leader>nm", ":Lex<CR>:vertical resize 30<CR>", opt)

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

-- Paste without losing the content of the register
vim.keymap.set("x", "<leader>P", '"_dP', opt)

-- Delete without saving the content of the register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Save to system clipboard registers "+ or "*  to copy "+y   to paste "+p
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

-- Replace shortcut  i ignore case  I case sensitive   c ask for confirmation
vim.keymap.set("n", "S", ":%s//gci<left><left><left><left>", opt)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opt)

-- Harpoon like movement mark with mQ mW mE mR mT
vim.keymap.set("n", "<leader>1", "'Q", opt)
vim.keymap.set("n", "<leader>2", "'W", opt)
vim.keymap.set("n", "<leader>3", "'E", opt)
vim.keymap.set("n", "<leader>4", "'R", opt)
vim.keymap.set("n", "<leader>5", "'T", opt)

-- Fast mask
vim.keymap.set("n", "<C-m>", "mA", opt)

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

