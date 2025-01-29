require("dan.core.keymaps")
require("dan.core.settings")
require("dan.core.autocmds")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.txt",
	callback = function()
		vim.opt_local.modeline = false
	end,
})
