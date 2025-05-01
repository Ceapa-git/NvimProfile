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
