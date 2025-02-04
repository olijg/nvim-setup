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

  -- Dashboard
  {
    'echasnovski/mini.starter',
    version = false,
    lazy = false,
    config = function()
      require('mini.starter').setup()
    end
  },

  -- Language Server Installer
  "williamboman/mason.nvim",

  -- Grep
  'BurntSushi/ripgrep',

  -- LSP and Autocompletion
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp"
  },

  -- Useful autocompletion sources
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/vim-vsnip',

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

  -- Fuzzy Finder
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      {

        "echasnovski/mini.icons",
        lazy = true
      }
    },
  },

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

})
