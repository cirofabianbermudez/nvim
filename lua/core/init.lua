if vim.g.vscode then
  require("core.vscode")
else
  require("core.set")
  require("core.remap")
  require("core.markdown")
  require("core.latex")
  require("core.neovide")
  require("core.systemverilog")
  require("core.formaters")
  require("core.lazy")
end
