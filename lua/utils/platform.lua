-- OS

local M = {}

local sys = vim.loop.os_uname().sysname

M.sys = sys
M.is_linux   = sys == "Linux"
M.is_macos   = sys == "Darwin"
M.is_windows = sys == "Windows_NT"

return M

