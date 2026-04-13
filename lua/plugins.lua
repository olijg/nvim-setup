-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Main colourscheme
  {
    "tomasr/molokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd(
        [[ colorscheme molokai ]]
      )
    end
  },
  -- Other colourschemes
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },

  -- LSP and Autocompletion
  { "mason-org/mason.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
  },

  "neovim/nvim-lspconfig",

  -- Autocompletion
  {
    'saghen/blink.cmp',
    lazy = true,
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    version = '1.*',
    opts_extend = { "sources.default" }
  },


  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    sync_install = false,
    -- Set this to false if you don't have tree-sitter installed locally!
    auto_install = true,
    ignore_install = {},
    highlight = { enable = true },
    indent = { enable = true },
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy=true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    }
  },
  {
    "kdheepak/nvim-dap-julia",
    lazy=true,
  },
  {
    'mfussenegger/nvim-dap-python',
    lazy=true,
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = false },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        }
      },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = false },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      image = { enabled = false }
    },
  },

  -- Java
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      vim.lsp.enable('jdtls')
    end,
  },

  -- Fast file navigation
  {
    'theprimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Undo Tree Utility
  'mbbill/undotree',

  'tpope/vim-abolish',

  -- Surrounding objects
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- File Explorer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  { 'nvim-mini/mini.icons', version = '*' },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" }
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      "BufReadPre " .. NotePath,
      "BufNewFile " .. NotePath,
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    }
  },

  -- HTTP API Calls
  {
    'mistweaverco/kulala.nvim',
    opts = {},
    ft = { "http" },
  },

  -- Code coverage
  'andythigpen/nvim-coverage',

  -- Pretty command line and messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  }
})
