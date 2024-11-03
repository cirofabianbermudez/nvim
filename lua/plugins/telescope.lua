return { -- DONE
  {
    enabled = true,
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)

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
          search_dirs = { vim.fn.expand("%:p") },
        })
      end

      local function diagnostics_current()
        builtin.diagnostics({
          bufnr = 0,
        })
      end

      vim.keymap.set("n", "<leader>fg", builtin.live_grep,     {desc = "Telescope: Live Grep (Root)", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fj", grep_current_file,     {desc = "Telescope: Live Grep (File)", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ff", builtin.find_files,    {desc = "Telescope: Find Files",       noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,       {desc = "Telescope: Buffers",          noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fr", builtin.registers,     {desc = "Telescope: Registers",        noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fm", builtin.marks,         {desc = "Telescope: Marks",            noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, {desc = "Telescope: Spell Suggest",    noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fd", search_docs,           {desc = "Telescope: Search docs",      noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fu", builtin.git_status,    {desc = "Telescope: Git status",       noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fi", builtin.git_commits,   {desc = "Telescope: Git commits",      noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fl", diagnostics_current,   {desc = "Telescope: Diagnostics",      noremap = true, silent = true })
    end,
  },
  {
    enabled = true,
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
