return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local config = require("neo-tree")
		config.setup({
			window = {
				width = 28,
				auto_expand_width = false,
			},
		})
		vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal left<CR>", { silent = true })
	end,
}

