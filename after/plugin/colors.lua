function ColorMyPencils(color)
  vim.opt.termguicolors = true
  color = color or "gruvbox-material"

  -- Specific to gruvbox-material
  vim.g.gruvbox_material_enable_italic = true

  vim.cmd.colorscheme(color)
end

ColorMyPencils()
