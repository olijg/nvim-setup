local fzflua = require('fzf-lua')
vim.keymap.set('n', '<leader>pf', "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<C-p>', "<cmd>lua require('fzf-lua').git_files()<CR>", { silent = true })
vim.keymap.set('n', '<leader>ps', "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })

fzflua.setup({
  winopts = {
    treesitter = {
      enabled = true
    }
  },
  fzf_colors = {
    true,
  },
})
