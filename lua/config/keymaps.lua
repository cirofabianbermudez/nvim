-- Keymaps

-- Set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load utils
local plat = require("utils.platform")
local map = require("utils.keymap").map
local path = require("utils.path")

-- Easy write and quit
map("n", "<leader>w", ":w<CR>", "Save File")
map("n", "<leader>q", ":q<CR>", "Quit Neovim")
map("n", "<leader>W", ":wa<CR>", "Save All Files")

-- Easy yank all or delete all
map("n", "Y", "y$", "Yank till EOL")
map("n", "<leader>ya", ":%y+<CR>", "Yank All")
map("n", "<leader>yd", ":%y+ | %d<CR>", "Yank All/Delete")

-- Tmux-navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Easy motion if wrap lines
map("n", "<A-j>", "gj")
map("n", "<A-k>", "gk")
map("n", "<A-h>", "h")
map("n", "<A-l>", "l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>")             -- Increase Window Height
map("n", "<C-Down>", "<cmd>resize -2<CR>")           -- Decrease Window Height
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>") -- Increase Window Width
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")  -- Decrease Window Width

-- Reload files
map("n", "<leader>0", ":e | :echo expand('%:p')<CR>", "Reload file")

-- Open file explorer / terminal
if plat.is_linux then

  map("n", "<leader>h", function()
    vim.fn.jobstart({ "nautilus", path.current_dir() }, { detach = true })
  end, "Open File Explorer")

  map("n", "<leader>;", function()
    vim.fn.jobstart({ "gnome-terminal", "--working-directory=" .. path.current_dir() }, { detach = true })
  end, "Open Terminal")

elseif plat.is_macos then

  map("n", "<leader>h", function()
    vim.fn.jobstart({ "open", path.current_dir() }, { detach = true })
  end, "Open File Explorer")

  map("n", "<leader>;", function()
    vim.fn.jobstart({ "open", "-a", "Terminal", path.current_dir() }, { detach = true })
  end, "Open Terminal")

elseif plat.is_windows then

  map("n", "<leader>h", function()
    vim.fn.jobstart({ "cmd.exe", "/c", "start", "", path.current_dir() }, { detach = true })
  end, "Open File Explorer")

  map("n", "<leader>;", function()
    vim.fn.jobstart({ "wt", "-d", path.current_dir() }, { detach = true })
  end, "Open Terminal")

end

-- See file current path
map("n", "<leader>?", ":echo expand('%:p')<CR>", "See current path")

-- Easy move between buffers
-- map("n", "<leader>o", ":bn<CR>")
-- map("n", "<leader>i", ":bp<CR>")
-- map("n", "<leader>c", ":bd<CR>")

-- Easy move between tabs
-- map("n", "<leader>O", ":tabnext<CR>")
-- map("n", "<leader>I", ":tabprevious<CR>")

--  Normal tab function
map("x", "<Tab>", ">")
map("x", "<S-Tab>", "<")

-- Toggle line wrap
map("n", "<leader>tw", ":set wrap!<CR>", "Toggle Wrap")

-- Toggle relative numbers
map("n", "<leader>tr", ":set relativenumber!<CR>", "Toggle Relative Numbers")

-- Show hidden characters
map("n", "<leader>th", function()
  vim.opt.list = not vim.opt.list:get()

  if vim.opt.list:get() then
    vim.opt.listchars = {
      tab = ">-",
      space = "·",
      nbsp = "␣",
      trail = "•",
      eol = "¶",
      precedes = "«",
      extends = "»",
    }
  end

  vim.notify("Listchars: " .. (vim.opt.list:get() and "ON" or "OFF"))
end, "Toggle listchars")

-- Toggle spell check
map("n", "<leader>ts", function()
  vim.opt.spell = not vim.opt.spell:get()
  if vim.opt.spell:get() then
    vim.opt.spelllang = { "en_us" }
  end
  vim.notify("Spell: " .. (vim.opt.spell:get() and "ON" or "OFF"))
end, "Toggle spell")

-- See last modification date

map("n", "<leader>lm", function()
  vim.notify("STATS: " .. require("utils.keymap").file_last_modified())
end, "See last modified date")


-- ===========================
--    ThePrimeagen Keymaps
-- ===========================

-- Move with indexing included
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Append with with cursor not moving
map("n", "J", "mzJ`z")

-- Move up and down keeping the cursor in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without losing the content of the register
map("x", "<leader>P", '"_dP')

-- Delete without saving the content of the register
map("n", "<leader>d", '"_d', "Delete to void (n)")
map("v", "<leader>d", '"_d', "Delete to void (v)")
map("n", "<leader>D", '"+d', "Delete to system clipboard (n)")
map("v", "<leader>D", '"+d', "Delete to system clipboard (v)")

-- Save to system clipboard registers "+ or "*  to copy "+y   to paste "+p
map("n", "<leader>y", '"+y', "Yank to system clipboard (n)")
map("v", "<leader>y", '"+y', "Yank to system clipboard (v)")

-- Paste from system clipboard
map("n", "<leader>p", '"+p', "Paste from system clipboard (n)")
map("v", "<leader>p", '"+p', "Paste from system clipboard (v)")

-- Replace shortcut  i ignore case  I case sensitive   c ask for confirmation
map("n", "<leader>ra", ":%s//gci<left><left><left><left>", "Replace asking")
map("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace in the entire file")

-- Save cursor
map("n", "<leader>sb", "mA", "Save cursor position")
map("n", "<leader>sm", "'A", "Load cursor position")

-- Harpoon like movement mark with mQ mW mE mR mT
map("n", "<leader>1", "'Q")
map("n", "<leader>2", "'W")
map("n", "<leader>3", "'E")
map("n", "<leader>4", "'R")
map("n", "<leader>5", "'T")

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

