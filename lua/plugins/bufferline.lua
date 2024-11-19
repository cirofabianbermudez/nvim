return { -- DONE
  enabled = true,
	cond = true,
	"akinsho/bufferline.nvim",
  event = "VeryLazy",
	-- dependencies = 'nvim-tree/nvim-web-devicons'}
  config = function()
	  local bufferline = require("bufferline")
		bufferline.setup({
		  options = {
        always_show_bufferline = false,
        style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
				offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
			},
		})
		vim.keymap.set("n", "<leader>o", ":BufferLineCycleNext<cr>", { desc = "BufferLine: Next",     noremap = true, silent = true }) -- :bn 
		vim.keymap.set("n", "<leader>i", ":BufferLineCyclePrev<cr>", { desc = "BufferLine: Previous", noremap = true, silent = true }) -- :bp
		vim.keymap.set("n", "<leader>c", ":bd<cr>",                  { desc = "BufferLine: Close",    noremap = true, silent = true })
	end,
}
