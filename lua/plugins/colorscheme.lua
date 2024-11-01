return {
  enabled = true,
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
	  style = "moon",
		comments = { italic = false },
		keywords = { italic = false },
	},
	config = function(_, opts)
	  require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
