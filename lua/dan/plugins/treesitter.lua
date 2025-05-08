return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	enabled = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"lua",
				"ruby",
				"html",
				"tsx",
				"bash",
				"markdown",
				"markdown_inline",
				"css",
				"c",
				"cpp",
				"angular",
				"java",
				"elixir",
			},
			indent = { enable = true },
			highlight = {
				enable = true,
				use_languagetree = true,
			},
		})
	end,
	require("ts_context_commentstring").setup({}),
}
