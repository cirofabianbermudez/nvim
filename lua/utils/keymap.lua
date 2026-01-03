-- Keymap

local M = {}

-- Options when running macros and remaps
M.opts = { noremap = true, silent = true }

-- Remap function
function M.map(mode, lhs, rhs, desc, extra_opts)
  local options = M.opts

  if desc then
    options = vim.tbl_extend("force", options, {desc = desc})
  end 

  if extra_opts then
    options = vim.tbl_extend("force", options, extra_opts)
  end 

  vim.keymap.set(mode, lhs, rhs, options)
end

return M

