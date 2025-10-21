vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Disable Space in normal/visual to use as leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Disable Space key" })

-- Move by visual lines when no count is given
vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up (visual line aware)" })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down (visual line aware)" })

-- Jump to line start/end with Alt + arrows
vim.keymap.set("n", "<A-Left>", "^", { silent = true, desc = "Go to first non-blank in line" })
vim.keymap.set("n", "<A-Right>", "$", { silent = true, desc = "Go to end of line" })

-- Save file (Shift + S)
vim.keymap.set("n", "S", ":write<CR>", { silent = true, desc = "Save file" })

-- Quit current window (Shift + Q)
vim.keymap.set("n", "Q", "<C-w>q", { silent = true, desc = "Quit current window" })

-- Split window vertically/horizontally
vim.keymap.set("n", "vv", "<C-w>v", { silent = true, desc = "Vertical split" })
vim.keymap.set("n", "ss", "<C-w>s", { silent = true, desc = "Horizontal split" })

-- Navigate between splits with Ctrl+Shift+Arrows
vim.keymap.set("n", "<C-S-Up>", "<C-w>k", { silent = true, desc = "Move to split above" })
vim.keymap.set("n", "<C-S-Down>", "<C-w>j", { silent = true, desc = "Move to split below" })
vim.keymap.set("n", "<C-S-Left>", "<C-w>h", { silent = true, desc = "Move to split left" })
vim.keymap.set("n", "<C-S-Right>", "<C-w>l", { silent = true, desc = "Move to split right" })

-- Indent / unindent in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- Keep cursor at end of yanked/pasted text
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Clear search highlight
vim.keymap.set("n", "<Leader>h", ":noh<CR>", { silent = true, desc = "Clear search highlight" })

-- Prevent losing yank buffer when pasting over selection
vim.keymap.set("v", "p", '"_dP', { desc = "Preserve yank buffer on paste" })

-- Select entire file
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select entire file" })
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", { desc = "Reselect entire file" })
