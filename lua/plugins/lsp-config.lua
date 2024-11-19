return { -- DONE
	{
		enabled = true,
		cond = true,
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"markdownlint",
					"stylua",
					"luacheck",
				},
			})
		end,
	},
	{
		enabled = false,
		cond = false,
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	{
		enabled = false,
		cond = false,
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({})
			-- vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover,       { desc = "LSP: Show Hover", noremap = true, silent = true })
			-- vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,  { desc = "LSP: Goto Definition", noremap = true, silent = true })
			-- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: Code Actions ", noremap = true, silent = true })
		end,
	},
	{
		enable = true,
		cond = true,
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = false,
				underline = false,
			})

			-- Add diagnostic keymaps
			local diagnostic_state = false
			vim.keymap.set("n", "<leader>ed", function()
				diagnostic_state = not diagnostic_state
				vim.diagnostic.config({
					virtual_text = diagnostic_state,
					signs = diagnostic_state,
					underline = diagnostic_state,
				})
			end, { desc = "Toggle Diagnostics" })

			-- vim.keymap.set('n', '<leader>ls', vim.diagnostic.show, { desc = "Show diagnostics" })
			--vim.keymap.set('n', '<leader>', vim.diagnostic.hide, { desc = "Hide diagnostics" })
			vim.keymap.set("n", "<leader>ls", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

			local lint = require("lint")
			lint.linters_by_ft = {
				lua = { "luacheck" },
				markdown = { "markdownlint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>ll", function()
				lint.try_lint()
			end, { desc = "LSP: Lint Code  ", noremap = true, silent = true })
		end,
	},
	{
		enable = true,
		cond = true,
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					markdown = { "prettier" },
				},
			})

			vim.keymap.set("n", "<leader>lf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "LSP: Format Code  ", noremap = true, silent = true })
		end,
	},
}
