return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	opts = {
		winopts = {
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "up:45%", -- up|down:size
			},
			backdrop = 0,
		},
		fzf_opts = {
			["--keep-right"] = "",
			["--layout"] = "default",
		},
		fzf_colors = {
			true,
			bg = "-1",
		},
	},
	keys = {
		{
			"<C-p>",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files",
		},
		{
			"<leader>b",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").live_grep({ resume = true })
			end,
			desc = "Live grep (resume)",
		},
		{
			"<leader><leader>/",
			function()
				require("fzf-lua").grep_curbuf()
			end,
			desc = "Grep in current buffer",
		},
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "LSP references",
		},
	},
}
