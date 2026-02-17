return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"clangd",
			"pylsp",
			"ruff",
			"angularls",
			"ts_ls",
			"html",
			"cssls",
		},
		automatic_installation = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig",
			keys = {
				{ "<leader>d", vim.diagnostic.open_float, desc = "Show diagnostics for line" },
				{ "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor" },
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename" },
				{ "gf", vim.lsp.buf.code_action, desc = "See available code actions" },
				{ "<leader>d", vim.diagnostic.open_float, desc = "Show diagnostics for line" },
				{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
			},
		},
	},
}
