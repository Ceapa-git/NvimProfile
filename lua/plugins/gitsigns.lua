return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {}, -- default setup is enough

	keys = {
		{
			"<leader>c",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Git hunk",
		},
	},
}
