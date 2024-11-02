local function load_session()
  if vim.bo.filetype == "dashboard" then
    vim.cmd("bdelete")
  end
    vim.cmd("source session.vim")
end

local function save_session()
  if vim.bo.filetype == "dashboard" then
    vim.cmd("bdelete")
  end
    vim.cmd("mks! session.vim")
end

vim.keymap.set("n", "<leader>ss", save_session,  { desc = "Save session",  noremap = true, silent = true })
vim.keymap.set("n", "<leader>sl", load_session,  { desc = "Load session",  noremap = true, silent = true })
