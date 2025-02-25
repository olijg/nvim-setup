local neogit = require('neogit')

vim.keymap.set("n", "<leader>gs", function()
  neogit.open({ kind = "split_above_all" })
end)

vim.keymap.set("n", "<leader>gg", function()
  neogit.open()
end)
