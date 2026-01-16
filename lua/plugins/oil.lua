local map = require("utils.keymap").map

return { -- DONE
	enabled = true,
  cond = true,
	"stevearc/oil.nvim",
  lazy = false,
  init = function()
    -- Disable netrw at startup
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
	opts = {
		default_file_explorer = true,
    float = {
      padding = 10,
    },
    keymaps = {

      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },

    },
	},
	config = function(_, opts)
		require("oil").setup(opts)

		map("n", "<leader>-", "<cmd>Oil<CR>", "Oil: Open cwd")

		map("n", "<leader>nt", function() 
      require("oil").toggle_float()
    end, "Oil: Open float")

	end,
}

