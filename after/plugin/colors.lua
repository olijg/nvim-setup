function ColorMyPencils(color)
  vim.opt.termguicolors = true
  color = color or "molokai"
  vim.cmd('colorscheme ' .. color)
end

ColorMyPencils()
