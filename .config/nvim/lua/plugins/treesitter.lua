local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  ensure_installed = {
--    "astro", "bash", "comment", "css", "dart", "dockerfile",
--    "go", "graphql", "help", "html", "javascript", "json",
--    "json5", "lua", "python", "regex", "ruby", "rust", "scss",
--    "toml", "tsx", "typescript", "vim", "vue", "yaml",
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true, -- install parser automatically based on filetype
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

