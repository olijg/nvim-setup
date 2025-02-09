--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option_value('updatetime', 300, { scope = 'global' })

vim.opt.signcolumn = "auto"

-- Show autodiagnostic popup on cursor hover_range
-- Show inlay_hints more frequently
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
