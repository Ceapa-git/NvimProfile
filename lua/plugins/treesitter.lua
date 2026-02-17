return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },

	opts = {
		ensure_installed = {
			"all",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},

	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {},
		},
	},
}
