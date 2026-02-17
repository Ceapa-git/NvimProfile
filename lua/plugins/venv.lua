return {
	"linux-cultist/venv-selector.nvim",
	event = "VeryLazy",
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		name = ".venv",
		auto_refresh = true,
		stay_on_open = false,
	},
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select virtualenv" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Re-select last venv" },
	},
}
