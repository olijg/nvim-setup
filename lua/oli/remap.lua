vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

--- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Replaces the currently selected text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Oil (File Manager)
vim.keymap.set("n", "<leader>ov", ":Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader>of", ":Oil --float<CR>", { silent = true })

--- Add lines below or above
vim.keymap.set("n", "[<leader>", "O<Esc>j")
vim.keymap.set("n", "]<leader>", "o<Esc>k")

-- Navigate buffers
vim.keymap.set("n", "[b", ":bp<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bn<CR>", { silent = true })
vim.keymap.set("n", "[B", ":bfirst<CR>", { silent = true })
vim.keymap.set("n", "]B", ":blast<CR>", { silent = true })

--JSON Format
vim.keymap.set("n", "<leader>jq", ":%!jq<CR>")
vim.keymap.set("v", "<leader>jq", ":!jq<CR>")

-- Maven
vim.keymap.set("n", '<leader>mc', function() vim.cmd('!mvn clean; mvn compile; mvn package') end)
vim.keymap.set("n", '<leader>mt', function() vim.cmd('!mvn test') end)
