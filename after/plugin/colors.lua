function ColorMyPencils(color)
  color = color or "molokai"
  --vim.cmd.colorscheme(color)
  --- Make the Background transparent
  -- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- Custom Colours
  vim.cmd("highlight Visual ctermbg=blue ctermfg=green guibg=darkcyan guifg=chartreuse")
  vim.cmd("highlight CmpItemMenuDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrMatchDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemKindDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrDefault guifg=#ffe792")
  vim.cmd("highlight CmpItemAbbrMatchFuzzyDefault guifg=#ffe792")
end

ColorMyPencils()
