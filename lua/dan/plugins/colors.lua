return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme moonfly")
		-- Make background transparent
		vim.cmd([[
            highlight Normal guibg=NONE ctermbg=NONE
            highlight NonText guibg=NONE ctermbg=NONE
            highlight LineNr guibg=NONE ctermbg=NONE
            highlight SignColumn guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE
        ]])
	end,
}
