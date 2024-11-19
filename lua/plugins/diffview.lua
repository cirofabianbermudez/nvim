return { -- DONE
	enabled = true,
  cond = true,
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
