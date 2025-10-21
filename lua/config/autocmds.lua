local aug = vim.api.nvim_create_augroup

-- Terminal: enter insert on open
local termgrp = aug("TermAutoInsert", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = termgrp,
  pattern = "*",
  command = "startinsert",
})
