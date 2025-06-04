vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "pom.xml",
	desc = "Run mvn compile when pom.xml changes",
	callback = function()
		vim.cmd("terminal mvn compile")
	end,
})

vim.filetype.add({
	extension = {
		vert = "glsl",
		frag = "glsl",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.glsl", "*.vert", "*.frag", "*.comp" },
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				return client.name == "glslls"
			end,
		})
	end,
})
