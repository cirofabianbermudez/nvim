-- Path

local M = {}

function M.current_dir()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    dir = vim.loop.cwd()
  end
  return dir
end

return M

