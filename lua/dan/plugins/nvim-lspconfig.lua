return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	enabled = true,
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_registry = require("mason-registry")
		local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
		local lombok_path = jdtls_path .. "/lombok.jar"
		local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
		local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace"

		-- Disable inline error messages
		vim.diagnostic.config({
			virtual_text = false,
			float = {
				border = "single",
			},
		})

		-- Add border to floating window
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

		-- Make float window transparent start

		local set_hl_for_floating_window = function()
			vim.api.nvim_set_hl(0, "NormalFloat", {
				link = "Normal",
			})
			vim.api.nvim_set_hl(0, "FloatBorder", {
				bg = "none",
			})
		end

		set_hl_for_floating_window()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			desc = "Avoid overwritten by loading color schemes later",
			callback = set_hl_for_floating_window,
		})

		-- Make float window transparent end

		local on_attach = function(client, bufnr)
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = bufnr, desc = "Show documentation for what is under cursor" }
			)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
			vim.keymap.set(
				{ "n", "v" },
				"gf",
				vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "See available code actions" }
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				{ buffer = bufnr, desc = "Show diagnostics for line" }
			)
			-- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {buffer = bufnr, desc = 'Show definition, references'})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = "✖", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure angular server
		lspconfig["angularls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = util.root_pattern("angular.json", "project.json", "nx.json"),
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure clang server
		lspconfig["clangd"].setup({
			cmd = { "clangd", "--compile-commands-dir=build" },
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
		})

		lspconfig["jdtls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- A basic root_dir pattern that works for Maven/Gradle projects
			root_dir = util.root_pattern("pom.xml", "build.gradle", ".git"),
			-- You could specify `cmd` here if needed:
			-- cmd = { "java-lsp.sh" },
			-- or rely on the default from Mason.
			settings = {
				java = {
					configuration = {
						updateBuildConfiguration = "interactive",
						annotaruntimes = {
							{
								name = "JavaSE-24",
								path = "/home/dan/.sdkman/candidates/java/current",
							},
						},
						tionProcessing = {
							enabled = true,
						},
					},
					eclipse = {
						downloadSources = true,
					},
					maven = {
						downloadSources = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					contentProvider = { preferred = "fernflower" },
					format = {
						enabled = true,
					},
				},
			},
			cmd = {
				"java",
				"-javaagent:" .. lombok_path,
				"-jar",
				launcher_jar,
				"-configuration",
				jdtls_path .. "/config_linux",
				"-data",
				workspace_dir,
			},
		})

		-- configure yaml server
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					schemas = {
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
					},
					validate = true,
					hover = true,
					completion = true,
				},
			},
		})

		-- configure dockerls server
		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure elixirls server
		lspconfig["elixirls"].setup({
			cmd = { require("mason-registry").get_package("elixir-ls"):get_install_path() .. "/language_server.sh" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure glslls
		lspconfig["glslls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "glsl", "vert", "frag" },
			root_dir = util.root_pattern(".git", "."),
			settings = {
				glslls = {
					glslangValidatorPath = "glslangValidator",
					defaultFileEncoding = "utf-8",
				},
			},
		})
	end,
}
