--
--                ____o__ __o____    o__ __o    
--                 /   \   /   \    /v     v\   
--                      \o/        />       <\  
--                       |        _\o____       
--                      < >            \_\__o__ 
--                       |                   \  
--                       o         \         /  
--                      <|          o       o   
--                      / \         <\__ __/>   
--                                              
--
-- The personal vim configuration of Thomas Stachl <thomas@stachl.me>

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.filetype.add({
  extension = {
    astro = "astro",
  },
})

require "core.disable"
require "core.options"
require "core.keymaps"
require "core.plugins"

-- vim: nospell
