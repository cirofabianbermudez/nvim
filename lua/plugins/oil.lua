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
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>", { desc = "Oil: Open cwd", noremap = true, silent = true })
	end,
}

