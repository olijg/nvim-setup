function ColorMyPencils(color)
  vim.opt.termguicolors = true
  color = color or "tokyonight-night"
  vim.cmd('colorscheme ' .. color)
end

ColorMyPencils()
