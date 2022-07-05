local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("user.plugins.lsp.installer")
require("user.plugins.lsp.handlers").setup()

