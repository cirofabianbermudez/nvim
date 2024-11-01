return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = "VeryLazy",
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
    disable = {"verilog", "systemverilog"},
		ensure_installed = {
			"bash",
			"bibtex",
			"c",
			"cmake",
			"cpp",
			"diff",
			"dockerfile",
			"git_rebase",
			"gitignore",
			"gnuplot",
			"html",
			"json",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"powershell",
			"python",
			"query",
			"toml",
			--"verilog",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	},
	config = function(_, opts)
	  require("nvim-treesitter.configs").setup(opts)
	end,
}
