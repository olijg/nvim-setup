-- Set completeopt to have a better completion experience 
-- (Deprecated: not sure I need this with blink?)
-- :help completeopt

-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu

-- shortmess: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option_value('updatetime', 300, { scope = 'global' })

vim.opt.signcolumn = "auto"
