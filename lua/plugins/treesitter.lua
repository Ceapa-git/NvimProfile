return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },

	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"c",
			"cpp",
			"rust",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"json",
			"yaml",
			"toml",
			"bash",
			"markdown",
			"markdown_inline",
		},
		auto_install = true, -- fetch a parser on the fly for any other filetype you open
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
