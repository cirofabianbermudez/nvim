return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "lua", "cpp", "python", "vim", "vimdoc", "markdown" },
			sync_install = false,
			auto_install = false,
			highlight = { 
        enable = true ,
        disable = { "verilog", "systemverilog" }
      },
		})
	end,
}

