vim.api.nvim_create_autocmd('FileType', {
  pattern = { "make", "cpp", "go", "markdown", "python", "systemverilog" },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "sh" },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start(0, "bash")
  end,
})

