require("oli.remap")
require("oli.set")

vim.o.background = "dark"
vim.opt.splitright = true

--- Obsidian notes setup
if os.getenv("HOME") then
  NotePath = "/mnt/c/Users/olive/Documents/Notes/"
else
  NotePath = "\\Users\\olive\\Documents\\Notes\\"
end

