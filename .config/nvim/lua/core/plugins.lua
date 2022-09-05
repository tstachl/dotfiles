-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "lib.packer")
if not ok then
  return
end

-- Have packer use a popup window
packer.init {
  profile = {
    enable = true,
    threshold = 0,
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- [[ GENERAL ]]
  use { "nvim-lua/popup.nvim", module = "popup" }
  use { "nvim-lua/plenary.nvim", module = "plenary" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    -- requires = {
    --   { "JoosepAlviste/nvim-ts-context-commentstring" },
    -- },
    run = ":TSUpdate",
    config = function() require("plugins.treesitter") end
  }
  
  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    config = function() require("plugins.toggleterm") end
  }

  -- [[ THEME ]]
  use {
    "EdenEast/nightfox.nvim",
    event = "VimEnter",
    config = function() require("plugins.colorscheme") end
  }

  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function() require("plugins.lualine") end
  }

  use {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "moll/vim-bbye" },
    },
    config = function() require("plugins.bufferline") end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    event = "VimEnter",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
    },
    config = function() require("plugins.nvimtree") end
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function() require('gitsigns').setup() end
  }

  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function() require("plugins.whichkey") end
  }

  -- [[ WRITE]]
  use {
    "hrsh7th/nvim-cmp",
    -- requires = {
    --   { "saadparwaiz1/cmp_luasnip" },
    --   { "hrsh7th/cmp-nvim-lsp" },
    --   { "hrsh7th/cmp-nvim-lua" },
    --   { "f3fora/cmp-spell" },
    -- },
    event = "InsertEnter",
    config = function() require("plugins.cmp") end,
    wants = "LuaSnip",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        event = "InsertCharPre",
      },
      { "rafamadriz/friendly-snippets", event = "InsertCharPre" },
      { "hrsh7th/cmp-buffer", event = "InsertCharPre" },
      { "hrsh7th/cmp-path", event = "InsertCharPre" },
      { "hrsh7th/cmp-cmdline", event = "InsertCharPre" },
    },
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function() require("plugins.autopairs") end
  }



  -- -- use "numToStr/Comment.nvim" -- Easily comment stuff


  -- -- use "ahmedkhalf/project.nvim"
  -- -- use "lewis6991/impatient.nvim"
  -- -- use "lukas-reineke/indent-blankline.nvim"
  -- -- use "goolord/alpha-nvim"
  -- -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight


  -- -- autocomplete engine plugins
  -- -- LSP
  -- use {
  --   "neovim/nvim-lspconfig",
  --   requires = {
  --     { "williamboman/nvim-lsp-installer" },
  --   },
  --   config = function() require("plugins.lsp") end
  -- }
  -- -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- -- Telescope
  -- use {
  --   "nvim-telescope/telescope.nvim",
  --   requires = {
  --     -- { "nvim-telescope/telescope-media-files.nvim" },
  --   },
  --   config = function() require("plugins.telescope") end
  -- }


  -- -- Git
  -- use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer.bootstrap then
    require("packer").sync()
  end
end)
