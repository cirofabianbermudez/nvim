return {
  "iamcco/markdown-preview.nvim",
	 config = function()
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }
    ft = { "markdown" }
    build = function() vim.fn["mkdp#util#install"]() end
	end,
}

