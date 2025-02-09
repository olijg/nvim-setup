vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.smart() end, { silent = true })
vim.keymap.set('n', '<leader>pf', function() Snacks.picker.files() end, { silent = true })
vim.keymap.set('n', '<C-p>', function() Snacks.picker.git_files() end, { silent = true })
vim.keymap.set('n', '<leader>ps', function() Snacks.picker.grep() end, { silent = true })
