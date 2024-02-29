function ColorMyPencils(color)
	color = color or "molokai"
	vim.cmd.colorscheme(color)
    --- Make the Background transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
