return { -- DONE
	enabled = false,
  cond = false,
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	opts = {
	},
	config = function(_, opts)
		require("diffview").setup(opts)
	end,
  -- :DiffviewFileHistory
  -- :DiffviewFileHistory %
  -- :DiffviewOpen
  -- :DiffviewClose
}
