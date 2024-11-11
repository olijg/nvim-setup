vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Clipboard Copy/Paste
vim.keymap.set("n", "<leader>pp", "\"+p")
vim.keymap.set("n", "<leader>y", "\"+y")

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

-- Debug
vim.keymap.set("n", "<leader>db", function() require('dapui').toggle() end, { silent = true })
vim.keymap.set('n', '<leader>dk', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)

-- Java specific
vim.keymap.set("v", '<leader>jc', function() vim.cmd("norm 0i //") end)

-- REST (Kulala)
vim.keymap.set('n', '<leader>R', function() require('kulala').run() end)
vim.keymap.set('n', '<leader>ra', function() require('kulala').run_all() end)
vim.keymap.set('n', '<leader>ri', function() require('kulala').inspect() end)
vim.keymap.set('n', '<leader>rr', function() require('kulala').scratchpad() end)
vim.keymap.set('n', '<leader>rv', function() require('kulala').toggle_view() end)
vim.keymap.set('n', '<leader>rq', function() require('kulala').close() end)
