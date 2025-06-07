return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup()

		local map = vim.keymap.set

		map("n", "<leader>c", gitsigns.preview_hunk, { desc = "Preview Git hunk", noremap = true, silent = true })
		map(
			"n",
			"<leader>cf",
			":vert Gitsigns diffthis<CR>",
			{ desc = "View full file diff (vertical)", noremap = true, silent = true }
		)
	end,
}
