return { -- DONE
  enabled = true,
	"lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
	opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {show_start = false, show_end = false},
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "trouble",
        "mason",
        "toggleterm",
        "lazyterm",
      },
    },
	},
  main = "ibl",
	-- config = function(_, opts)
	--   require("ibl").setup(opts)
	-- end,
}


