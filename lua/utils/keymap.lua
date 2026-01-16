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


function M.file_last_modified()
	local file = vim.fn.expand("%:p")
	if file == "" then
		return "No File"
	end

	local stat = vim.loop.fs_stat(file)
	if not stat then
		return ""
	end

	local last_modified = stat.mtime.sec
	local current_time = os.time()
	local diff = os.difftime(current_time, last_modified)

	local minutes = math.floor(diff / 60)
	local hours = math.floor(minutes / 60)
	local days = math.floor(hours / 24)

	local message = "Last-edit: "
	local tail

	if days > 0 then
		tail = string.format("%dd ago", days)
	elseif hours > 0 then
		tail = string.format("%dh ago", hours)
	elseif minutes > 0 then
		tail = string.format("%dm ago", minutes)
	else
		tail = "Just now"
	end

	return message .. tail
end

return M

