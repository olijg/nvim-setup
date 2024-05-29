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
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    -- Java LSP
    'mfussenegger/nvim-jdtls',


    -- Useful autocompletion sources
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',

    -- Fuzzy Finder
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            {
                "nvim-tree/nvim-web-devicons",
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
                        "lua",
                        "vim",
                        "vimdoc",
                        "javascript",
                        "julia",
                        "typescript",
                        "rust",
                        "query",
                        "python"
                    },
                    sync_install = false,
                    highlight = { enable = true },
                    autotag = { enable = true },
                    indent = { enable = true },
                })
        end
    },

    'windwp/nvim-ts-autotag',

    -- Fast file navigation
    'theprimeagen/harpoon',

    -- Undo Tree Utility
    'mbbill/undotree',

    -- Git Integration
    'tpope/vim-fugitive',


    'tpope/vim-abolish',

    -- Surrounding objects
    'machakann/vim-sandwich',

    -- Inline Copilot
    'github/copilot.vim',

    -- Copilot Chat
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    -- File Explorer
    'preservim/nerdtree'
})

