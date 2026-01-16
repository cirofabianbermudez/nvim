return { -- DONE
	{
		enabled = false,
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			terminal_colors = true,
			styles = {
				-- comments  = { fg = "#616E88",italic = false},
				-- comments  = { fg = "#A1AEC8", italic = false, bold = false },
				comments  = { fg = "#8691a8", italic = false, bold = false },
				keywords  = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
			},
		},
		config = function(_, opts)
			require("nord").setup(opts)
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		enabled = true,
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
		},
		config = function(_, opts)
			require("vscode").setup(opts)
			vim.cmd.colorscheme("vscode")
		end,
	},
}

