return { -- DONE
  enabled = true,
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = { },
  config = function(_, opts)
    -- require("nvim-treesitter").setup(opts)
    require("nvim-treesitter").install({
      "bash",
      "bibtex",
      "rust",
      "cpp",
      "gitignore",
      "markdown",
      "markdown_inline",
      "python",
      "go",
      "gnuplot",
      "python",
      "lua",
      "make",
      "latex",
      "systemverilog",
    })
  end,
}

