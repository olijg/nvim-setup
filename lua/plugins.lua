local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        "williamboman/mason.nvim"
    }
    require("mason").setup()

    use 'simrat39/rust-tools.nvim'

    use 'BurntSushi/ripgrep'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" }
    use { "sainnhe/sonokai" }
    use { "tomasr/molokai" }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use('nvim-treesitter/playground')
    use('windwp/nvim-ts-autotag')
    --- Harpoon for fast file search
    use('theprimeagen/harpoon')
    --- Undo tree because everyone makes mistakes
    use('mbbill/undotree')
    --- Git integration
    use('tpope/vim-fugitive')
    --- Surround text objects
    use('machakann/vim-sandwich')
    --- AI Copilot
    use('github/copilot.vim')
    --- Filesystem tree
    use('preservim/nerdtree')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
