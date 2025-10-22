return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	enabled = true,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"antosha417/nvim-lsp-file-operations",
	},

	init = function()
		require("lsp-file-operations").setup()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function set_tree_arrows()
			vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", { fg = "#3FC5FF" })
			vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", { fg = "#3FC5FF" })
		end
		set_tree_arrows()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = set_tree_arrows })
	end,

	opts = function()
		local function natural_cmp(left, right)
			if left.type ~= "directory" and right.type == "directory" then
				return false
			end
			if left.type == "directory" and right.type ~= "directory" then
				return true
			end
			local l, r = left.name:lower(), right.name:lower()
			if l == r then
				return false
			end
			local maxlen = math.max(#l, #r)
			for i = 1, maxlen do
				local ls, rs = l:sub(i), r:sub(i)
				local ln, rn = tonumber(ls:sub(1, 1)), tonumber(rs:sub(1, 1))
				if ln and rn then
					local lnum = tonumber(ls:match("^[0-9]+"))
					local rnum = tonumber(rs:match("^[0-9]+"))
					if lnum ~= rnum then
						return lnum < rnum
					end
				elseif ls:sub(1, 1) ~= rs:sub(1, 1) then
					return ls < rs
				end
			end
		end

		return {
			sort = {
				sorter = function(nodes)
					table.sort(nodes, natural_cmp)
				end,
			},
			view = { width = 35 },
			renderer = {
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						folder = { arrow_closed = "", arrow_open = "" },
					},
				},
			},
			actions = { open_file = { window_picker = { enable = true } } },
			filters = { custom = { ".DS_Store" } },
			git = { enable = false },
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = { hint = "", info = "", warning = "", error = "" },
			},
		}
	end,

	keys = {
		{ "<leader>ee", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
		{ "<leader>ef", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "Explorer on current file" },
		{ "<leader>ec", "<Cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
		{ "<leader>er", "<Cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
	},
}
