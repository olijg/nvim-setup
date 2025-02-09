function ColorMyPencils(color)
  vim.opt.termguicolors = true
  color = color or "molokai"
  -- Custom Colours
  vim.cmd("highlight Visual ctermbg=blue ctermfg=green guibg=darkcyan guifg=chartreuse")
  vim.cmd("highlight CmpItemMenuDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrMatchDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemKindDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrMatchFuzzyDefault guifg=#ffe792")
end

ColorMyPencils()
