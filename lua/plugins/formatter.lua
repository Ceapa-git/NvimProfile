return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		format_on_save = { lsp_fallback = true, timeout_ms = 1000 },
	},
}
