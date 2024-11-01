local function file_last_modified()

	local file = vim.fn.expand('%:p')
	if file == '' then return '' end
	
	local stat = vim.loop.fs_stat(file)
	if not stat then return '' end
	
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
		tail =  string.format("%dm ago", minutes)
	else
		tail = "Just now"
	end
	
	return message .. tail
end

return {
  enabled = true,
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
  end,
	opts = {
	  options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "neo-tree" },
			},
		sections = {
		  lualine_x = { file_last_modified, 'encoding', 'fileformat', 'filetype'},
		},
	},
}
