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
	config = function(_, opts)
		-- Advertise full nvim-cmp completion capabilities (snippets, etc.) to every LSP server
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		require("mason-lspconfig").setup(opts)
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				-- LSP servers come from mason-lspconfig's ensure_installed above;
				-- list formatters/tools here that aren't LSP servers
				ensure_installed = { "stylua", "clang-format" },
				auto_update = true,
				run_on_start = true,
				integrations = {
					["mason-lspconfig"] = true,
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			keys = {
				{ "<leader>d", vim.diagnostic.open_float, desc = "Show diagnostics for line" },
				{ "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor" },
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename" },
				{ "gf", vim.lsp.buf.code_action, desc = "See available code actions" },
				{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
			},
		},
	},
}
