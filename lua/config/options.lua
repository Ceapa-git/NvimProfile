-- General editing
vim.o.hlsearch = true -- Highlight search results
vim.wo.number = true -- Show line numbers
vim.o.mouse = "a" -- Enable mouse support
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.breakindent = true -- Preserve indentation in wrapped lines

-- Files and backups
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable backup before overwriting
vim.o.undofile = true -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Undo history directory

-- Search
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- ...unless uppercase in query

-- UI
vim.wo.signcolumn = "yes" -- Always show sign column
vim.o.updatetime = 250 -- Faster update time for diagnostics
vim.o.timeoutlen = 300 -- Mapped sequence timeout
vim.o.completeopt = "menuone,noselect" -- Better completion behavior
vim.opt.splitbelow = true -- Horizontal splits below
vim.opt.splitright = true -- Vertical splits to the right
vim.o.lazyredraw = true -- Don’t redraw during macros or scripts

-- File handling
vim.opt.autoread = true -- Auto reload files changed outside Neovim

-- Indentation
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Smarter autoindenting
vim.opt.smarttab = true -- Smart handling of tab key
vim.opt.tabstop = 2 -- Tab width (spaces)
vim.opt.softtabstop = 2 -- Insert/delete 2 spaces when pressing Tab/BS
vim.opt.shiftwidth = 2 -- Indent by 2 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Line wrapping
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Wrap at word boundaries
vim.opt.showbreak = "↳" -- Show this symbol for wrapped lines

-- Scrolling
vim.opt.scrolloff = 8 -- Minimum lines above/below cursor
vim.opt.sidescrolloff = 15 -- Minimum columns beside cursor
vim.opt.sidescroll = 5 -- Horizontal scroll step

-- Misc
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.gdefault = true -- Substitute globally by default

-- Border for windows
vim.o.winborder = "rounded"
