return { -- DONE
  enabled = false,
  cond = false,
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {
    need = 0,
  },
  keys = {
    { "<leader>ms", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>mS", function() require("persistence").select() end,desc = "Select Session" },
    { "<leader>ml", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>md", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
