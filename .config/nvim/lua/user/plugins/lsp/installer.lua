local ok, installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

local lspconfig = require("lspconfig")
local servers = { "jsonls", "sumneko_lua", "rust_analyzer" }

installer.setup {
  ensure_installed = servers
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.plugins.lsp.handlers").on_attach,
    capabilities = require("user.plugins.lsp.handlers").capabilities,
  }

  local settings_ok, settings = pcall(require, "user.plugins.lsp.settings." .. server)
  if settings_ok then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  lspconfig[server].setup(opts)
end
