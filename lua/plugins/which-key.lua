return {
  enabled = true,
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
	  defaults = {},
		spec = {
		  {
			  mode = { "n", "v" }, { "<leader>n", group = "Neotree"},
			  mode = { "n", "v" }, { "<leader>f", group = "Telescope"},
			  mode = { "n", "v" }, { "<leader>e", group = "Toggle"},
			  mode = { "n", "v" }, { "<leader>y", group = "Yank"},
			  mode = { "n", "v" }, { "<leader>s", group = "Search/Replace"},
			  mode = { "n", "v" }, { "<leader>v", group = "Verilog"},
			},
		},
  },
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
	},
} 
