local fn = vim.fn
local path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(path)) > 0 then
  bootstrap = fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. path)
  -- Ref: https://github.com/wbthomason/packer.nvim/issues/739#issuecomment-1019280631
  vim.o.runtimepath = fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
  auto_clean = true,
  compile_on_sync = true,
}

packer.set_handler('config', function(_, plugin, value)
  if type(value) == 'string' and fn.filereadable(fn.expand(value)) == 1 then
    plugin.config = "vim.cmd('source " .. value .. "')"
  end
end)

packer.bootstrap = bootstrap

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return packer
