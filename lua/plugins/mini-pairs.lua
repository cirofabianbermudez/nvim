return { -- DONE
  enabled = false,
  'echasnovski/mini.pairs',
  version = '*',
	event = "VeryLazy",
	opts = {
    modes = { insert = true, command = true},
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_unbalanced = true,
    markdown = true,
	},
	config = function(_, opts)
	  require("mini.pairs").setup(opts)
	end,
}
