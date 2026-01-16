local map = require("utils.keymap").map
local path = require("utils.path")
local plat = require("utils.platform")

return { -- DONE
  {
    enabled = true,
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)

      local builtin = require("telescope.builtin")
      local docs_path

      -- Path to the documentation
      if plat.is_windows then
        docs_path = os.getenv("USERPROFILE") .. "\\AppData\\Local\\nvim\\docs"
      else
        docs_path = os.getenv("HOME") .. "/.config/nvim/docs"
      end

      local function search_docs()
        builtin.find_files({
          cwd = docs_path,
          find_command = { "rg", "--files", "--type", "md" , "--no-ignore"},
        })
      end

      local function search_dir()
        builtin.find_files({
          cwd = path.current_dir(),
        })
      end

      local function grep_current_file()
        builtin.live_grep({
          search_dirs = { vim.fn.expand("%:p") },
        })
      end

      local function grep_current_dir()
        builtin.live_grep({
          search_dirs = { path.current_dir() },
        })
      end

      -- local function diagnostics_current()
      --   builtin.diagnostics({
      --     bufnr = 0,
      --   })
      -- end

      map("n", "<leader>fg", builtin.live_grep,     "Telescope: Live Grep (Root)")
      map("n", "<leader>fh", grep_current_dir,      "Telescope: Live Grep (Dir)")
      map("n", "<leader>fj", grep_current_file,     "Telescope: Live Grep (File)")
      map("n", "<leader>ff", builtin.find_files,    "Telescope: Find Files (Root)")
      map("n", "<leader>fk", search_dir,            "Telescope: Find Files (Dir)")
      map("n", "<leader>fd", search_docs,           "Telescope: Search docs")
      map("n", "<leader>fb", builtin.buffers,       "Telescope: Buffers")
      map("n", "<leader>fr", builtin.registers,     "Telescope: Registers")
      map("n", "<leader>fm", builtin.marks,         "Telescope: Marks")
      map("n", "<leader>fs", builtin.spell_suggest, "Telescope: Spell Suggest")
      map("n", "<leader>fu", builtin.git_status,    "Telescope: Git status")
      map("n", "<leader>fi", builtin.git_commits,   "Telescope: Git commits")
      -- map("n", "<leader>fl", diagnostics_current,   "Telescope: Diagnostics")
    end,
  },
}

