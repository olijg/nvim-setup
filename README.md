# Personal Nvim Config

Tested and works on WSL2 Ubuntu and Windows Powershell (+ Neovide)

Requires nvim v0.10+

## Dependencies

Recommend installing Tree-Sitter:
```bash
cargo install --locked tree-sitter-cli
```


## Configuration Summary

This Neovim configuration is managed using Lazy, a plugin manager.  It includes the following key features:

- **Plugin Management:** Uses `lazy.nvim` to manage and load plugins.
- **Colorschemes:** Includes `tokyonight.nvim` as the primary colorscheme, with options for `catppuccin`, `molokai`, and `kanagawa.nvim`.
- **Dashboard:** Uses `snacks.nvim` to provide a dashboard with keymaps, recent files, and projects.
- **LSP and Autocompletion:** Configures LSP support with `nvim-lspconfig`, `mason.nvim`, and `mason-lspconfig.nvim`. Autocompletion is managed with `nvim-cmp` and related plugins for LSP, LuaSnip, and other sources.
- **AI Coding Companion:** Integrates `codecompanion.nvim` for AI-assisted coding.
- **Treesitter:** Uses `nvim-treesitter` for syntax highlighting and code parsing.
- **Debugging:** Includes `nvim-dap-ui`, `nvim-dap-julia`, and `nvim-dap-python` for debugging support.
- **File Explorer:** Uses `oil.nvim` for file exploration.
- **File Navigation:** Uses `harpoon` for fast file navigation.
- **Git Integration:** Integrates `vim-fugitive` for Git support.
- **HTTP Client:** Uses `kulala.nvim` for making HTTP requests.
- **Code Coverage:** Uses `nvim-coverage` for code coverage reports.

The `opts.lua` file configures:

- `completeopt` for improved completion experience.
- `shortmess` to avoid extra messages during completion.
- `updatetime` for cursor hold.
- `signcolumn` for diagnostics.


