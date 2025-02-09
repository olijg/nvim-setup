vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  command = "setlocal shiftwidth=4 tabstop=4"
})

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false

-- Configure undodir depending on OS
if os.getenv("HOME") then
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
  vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
end

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 6
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
