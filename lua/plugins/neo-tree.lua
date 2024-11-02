return { -- DONE
  enabled = true,
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
	  sources = { "filesystem", "buffers", "git_status" },
		filesystem = {
		  bind_to_cwd = false,
		  follow_current_file = { enabled = true },
		},
    window = {
      width = 30,
    },
	},
	config = function(_, opts)
	  require("neo-tree").setup(opts)
		vim.keymap.set("n", "<leader>nt", ":Neotree source=filesystem toggle=true<CR>",                                           { desc = "Neotree: (Root Dir)", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>nf", ":Neotree dir=" .. vim.fn.expand("%:p:h") .. "  toggle=true reveal_force_cwd=true<CR>", { desc = "Neotree: (cwd)",      noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ng", ":Neotree source=git_status toggle=true<CR>",                                           { desc = "Neotree: (Git)",      noremap = true, silent = true })
		vim.keymap.set("n", "<leader>nb", ":Neotree source=buffers toggle=true<CR>",                                              { desc = "Neotree: (Buffer)",   noremap = true, silent = true })
	end,
} 
