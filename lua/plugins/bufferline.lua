local map = require("utils.keymap").map

return { -- DONE
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      always_show_bufferline = false,
      separator_style = "slant",
      indicator = {
        -- style = "underline",
      },
    },
  },
  config = function(_, opts)
    local bufferline = require("bufferline")

    -- inject presets now that bufferline is loaded
    opts.options.style_preset = {
      -- bufferline.style_preset.no_italic,
      -- bufferline.style_preset.no_bold,
    }

    bufferline.setup(opts)

    map("n", "<leader>o", "<cmd>BufferLineCycleNext<CR>", "BufferLine: Next")
    map("n", "<leader>i", "<cmd>BufferLineCyclePrev<CR>", "BufferLine: Previous")
    map("n", "<leader>c", "<cmd>bd<CR>", "BufferLine: Close")
    map("n", "<leader>bo", "<cmd>BufferLineMoveNext<CR>", "BufferLine: Move Right")
    map("n", "<leader>bi", "<cmd>BufferLineMovePrev<CR>", "BufferLine: Move Left")
    map("n", "<leader>bs", "<cmd>BufferLineSortByExtension<CR>", "BufferLine: Sort")
  end,
}

