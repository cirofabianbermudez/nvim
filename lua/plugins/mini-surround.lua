return { -- DONE
  enabled = true,
  cond = true,
  'echasnovski/mini.surround',
  version = '*',
	event = "VeryLazy",
	opts = {
	},
	config = function(_, opts)
	  require("mini.surround").setup(opts)
	end,
}
