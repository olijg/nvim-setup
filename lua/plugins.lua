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

  -- Main Colorscheme
  {
    "tomasr/molokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme molokai]])
    end
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        }
      },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      picker = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },

  -- Language Server Installer
  "williamboman/mason.nvim",

  -- LSP and Autocompletion
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  -- Useful autocompletion sources
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-cmdline',

  -- AI Coding Companion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lus/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true
  },

  { 'echasnovski/mini.nvim', version = false },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
        ensure_installed = {
          "c",
          "markdown",
          "lua",
          "kotlin",
          "http",
          "html",
          "css",
          "vim",
          "yaml",
          "java",
          "vimdoc",
          "make",
          "javascript",
          "julia",
          "typescript",
          "rust",
          "query",
          "python",
          "dockerfile"
        },
        sync_install = false,
        -- Set this to false if you don't have tree-sitter installed locally!
        auto_install = true,
        highlight = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        ignore_install = {},
      })
    end
  },

  -- Java LSP
  {
    'mfussenegger/nvim-jdtls',
    dependencies = {
      -- DAP
      'mfussenegger/nvim-dap',
    }
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    }
  },
  "kdheepak/nvim-dap-julia",
  'mfussenegger/nvim-dap-python',

  -- Fast file navigation
  {
    'theprimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Undo Tree Utility
  'mbbill/undotree',

  -- Git Integration
  'tpope/vim-fugitive',


  'tpope/vim-abolish',

  -- Surrounding objects
  'machakann/vim-sandwich',

  -- File Explorer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },

  -- AI
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",              -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    },
    config = true,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },

-- HTTP API Calls
  {
    'mistweaverco/kulala.nvim',
    opts = {},
    ft = { "http" },
  },
})


