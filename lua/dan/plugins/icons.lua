return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local devicons = require("nvim-web-devicons")

		devicons.set_icon({
			vert = {
				icon = "",
				color = "#00afff",
				name = "Vert",
			},
			frag = {
				icon = "",
				color = "#ff66cc",
				name = "Frag",
			},
			comp = {
				icon = "󰍛",
				color = "#ffaa00",
				name = "Comp",
			},
		})

		devicons.setup({})
	end,
}
