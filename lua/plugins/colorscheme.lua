return { -- DONE
	{
		enabled = false,
		cond = false,
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "auto", -- latte, frape, macchiato, mocha
			show_end_of_buffer = true,
			term_colors = true,
			no_italic = true,
			no_bold = true,
			no_underline = true,
			custom_highlights = function(colors)
				return {
					-- Comment = {fg = colors.flamingo},
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		enabled = true,
		cond = true,
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
}

