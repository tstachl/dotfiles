vim.opt_local.colorcolumn = "81"
vim.opt_local.autoindent = true
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.textwidth = 80

vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }
vim.opt_local.conceallevel = 2


local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  vim.notify("Plugin cmp not installed!")
  return
end

cmp.setup.buffer {
  sources = {
    { name = "spell" },
    { name = "path" },
  },
  experimental = {
    ghost_text = false,
  },
}

