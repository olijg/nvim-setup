vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

--- NERDTree
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

--- Work shortcuts
vim.keymap.set("n", "<leader>si", ":belowright split<CR> :term shellfoundry install <CR><C-\\><C-n>")
