vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

--- NERDTree
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

--- Add lines below or above
vim.keymap.set("n", "[<leader>", "O<Esc>j")
vim.keymap.set("n", "]<leader>", "o<Esc>k")

-- Navigate buffers
vim.keymap.set("n", "[b", ":bp<CR>", { silent = true})
vim.keymap.set("n", "]b", ":bn<CR>", { silent = true})
vim.keymap.set("n", "[B", ":bfirst<CR>", { silent = true})
vim.keymap.set("n", "]B", ":blast<CR>", { silent = true})

