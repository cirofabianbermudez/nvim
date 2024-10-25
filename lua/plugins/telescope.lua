return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

      local is_windows = package.config:sub(1, 1) == '\\'
      local docs_path

      if is_windows then
          docs_path = os.getenv("USERPROFILE") .. "\\AppData\\Local\\nvim\\doc"
      else
          docs_path = os.getenv("HOME") .. "/.config/nvim/doc"
      end

      local function search_docs()
        builtin.find_files({
          cwd = docs_path,
          find_command = { "rg", "--files", "--type", "md" },
        })
      end
     local function grep_current_file()
        builtin.live_grep({
          --search = vim.fn.input("Grep > "),
          search_dirs = { vim.fn.expand("%:p") },
          --grep_open_files = true,
        })
      end
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fj", grep_current_file, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fr", builtin.registers, {})
			vim.keymap.set("n", "<leader>fm", builtin.marks, {})
			vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, {})
			vim.keymap.set("n", "<leader>fd", search_docs, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
        pickers = {
          find_files = {
            -- hidden = true,
            -- no_ignore = true,
          },
        },
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

