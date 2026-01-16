-- Main entry point for Neovim configuration

if vim.g.vscode then
  require("config.common")
  require("config.vscode")
else
  require("config.setup")
  require("config.keymaps")
  -- require("config.sessions")
  -- require("config.markdown")
  -- require("config.latex")
  require("config.lazy")
  require("config.autocmds")
end

