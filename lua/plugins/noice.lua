return { -- DONE
  enabled = false,
  cond = false,
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
	},
  opts = {
    presets = {
      -- bottom_search = false,
      -- command_palette = true,
      -- long_message_to_split = true,
      inc_rename = false,
      -- lsp_doc_border = false,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_showmode",
        },
        opts = { skip = true },
      },
    },
    messages = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
  },
	config = function(_, opts)
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end
    require("noice").setup(opts)
	end,
}
