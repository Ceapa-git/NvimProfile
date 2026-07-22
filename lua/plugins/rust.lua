return {
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false, -- rust-analyzer setup must run at startup, not on-demand
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {}, -- Cargo.toml dependency versions/completion/diagnostics
	},
}
