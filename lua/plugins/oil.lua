return {
  enabled = true,
	"stevearc/oil.nvim",
	opts = {
	  default_file_explorer = false,
	},
	config = function(_, opts)
	  require("oil").setup(opts)
		vim.keymap.set("n", "<leader>-", ":Oil<CR>", { desc = "Oil: Open cwd", noremap = true, silent = true })
	end,
}
