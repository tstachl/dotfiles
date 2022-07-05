-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "user.packer")
if not ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- My plugins here
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    config = function() require("user.plugins.autopairs") end
  }

  use {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({ enable = true })
    end
  }

  -- use "numToStr/Comment.nvim" -- Easily comment stuff
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
    },
    config = function() require("user.plugins.nvimtree") end
  }

  use {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "moll/vim-bbye" },
    },
    config = function() require("user.plugins.bufferline") end
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function() require("user.plugins.toggleterm") end
  }
  -- use "akinsho/toggleterm.nvim"
  -- use "ahmedkhalf/project.nvim"
  -- use "lewis6991/impatient.nvim"
  -- use "lukas-reineke/indent-blankline.nvim"
  -- use "goolord/alpha-nvim"
  -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use {
    "folke/which-key.nvim",
    config = function() require("user.plugins.whichkey") end
  }

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use {
    "cocopon/iceberg.vim",
    config = function() require("user.plugins.colorscheme") end
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function() require("user.plugins.lualine") end
  }

  -- autocomplete engine plugins
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "L3MON4D3/LuaSnip" }, --snippet engine
      { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
      { "f3fora/cmp-spell" },
    },
    config = function() require("user.plugins.cmp") end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      { "williamboman/nvim-lsp-installer" },
    },
    config = function() require("user.plugins.lsp") end
  }
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      -- { "nvim-telescope/telescope-media-files.nvim" },
    },
    config = function() require("user.plugins.telescope") end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    run = ":TSUpdate",
    config = function() require("user.plugins.treesitter") end
  }

  -- -- Git
  -- use "lewis6991/gitsigns.nvim"

  -- VimWiki
  use {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/wiki',
          syntax = 'markdown',
          ext = '.md',
        }
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer.bootstrap then
    require("packer").sync()
  end
end)
