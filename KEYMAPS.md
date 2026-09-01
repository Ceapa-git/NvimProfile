# Keymaps

Leader is `Space`.

## General editing

| Keys | Mode | Action |
|---|---|---|
| `<Esc>` | Terminal | Exit terminal mode |
| `<Up>` / `<Down>` | Normal | Move by visual line when no count given |
| `<A-Left>` | Normal | Go to first non-blank in line |
| `<A-Right>` | Normal | Go to end of line |
| `<Tab>` | Visual | Indent selection |
| `<S-Tab>` | Visual | Unindent selection |
| `y` | Visual | Yank, keep cursor at end of text |
| `p` | Visual | Paste without clobbering the yank register |
| `p` | Normal/Visual | Paste, keep cursor at end of pasted text |
| `<leader>h` | Normal | Clear search highlight |
| `<C-a>` | Normal/Visual | Select entire file |

## Windows & splits

| Keys | Action |
|---|---|
| `S` | Save file |
| `Q` | Quit current window |
| `vv` | Vertical split |
| `ss` | Horizontal split |
| `<C-S-Up>` / `<C-S-Down>` / `<C-S-Left>` / `<C-S-Right>` | Move to split above/below/left/right |

## LSP

| Keys | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | LSP references (fzf-lua) |
| `gf` | Code actions |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Line diagnostics |

## Fuzzy finding (fzf-lua)

| Keys | Action |
|---|---|
| `<C-p>` | Find files |
| `<leader>b` | Find buffers |
| `<leader>/` | Live grep (resume previous search) |
| `<leader><leader>/` | Grep current buffer |

## File explorer (nvim-tree)

| Keys | Action |
|---|---|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Explorer on current file |
| `<leader>ec` | Collapse file explorer |
| `<leader>er` | Refresh file explorer |

## Git (gitsigns)

| Keys | Action |
|---|---|
| `<leader>c` | Preview git hunk |

## Python (venv-selector)

| Keys | Action |
|---|---|
| `<leader>vs` | Select virtualenv |
| `<leader>vc` | Re-select last venv |

## Debugging (nvim-dap / nvim-dap-ui)

| Keys | Action |
|---|---|
| `F5` | Continue / start debugging |
| `<S-F5>` | Terminate |
| `F9` | Toggle breakpoint |
| `F10` | Step over |
| `F11` | Step into |
| `<S-F11>` | Step out |
| `<leader>xB` | Conditional breakpoint |
| `<leader>xr` | Toggle REPL |
| `<leader>xu` | Toggle debug UI |
