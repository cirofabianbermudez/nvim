return { -- DONE
	enabled = true,
	"nvim-lualine/lualine.nvim",
  lazy = false,
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
			disabled_filetypes = { "dashboard", "alpha", "ministarter", "neo-tree" },
		},
		sections = {
			lualine_x = { "encoding", "fileformat", "filetype" },
		},
		extensions = { "neo-tree", "lazy", "fzf", "man" },
	},
}

