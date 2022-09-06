local theme = "nightfox"

local ok, scheme = pcall(require, theme)
if not ok then
  return
end

require(theme).setup {
  options = {
    transparent = true,
  },
}

vim.cmd("colorscheme nordfox")

