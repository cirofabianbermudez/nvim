return { -- DONE
	enabled = false,
	cond = false,
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
	},
  keys = {
    { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
