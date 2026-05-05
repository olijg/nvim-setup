require('nvim-treesitter').install {
  "c",
  "bash",
  "markdown",
  "markdown_inline",
  "lua",
  "kotlin",
  "http",
  "go",
  "html",
  "regex",
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
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})
