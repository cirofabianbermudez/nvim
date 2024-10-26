return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local config = require("lualine")
		config.setup({
			options = {
				icons_enabled = false,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "neo-tree" },
			},
      sections = {
        lualine_x = {
        --  {
        --    function()
        --      local file = vim.fn.expand('%:p')
        --      if file == '' then return '' end
        --      local stat = vim.loop.fs_stat(file)
        --      if not stat then return '' end
        --      return "Last edit: " .. os.date('%Y/%m/%d %H:%M:%S', stat.mtime.sec)
        --    end
        --  },
          {
            function()
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
          },'encoding', 'fileformat', 'filetype'},
      },
		})
	end,
}

