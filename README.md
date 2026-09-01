# nvim config

Personal Neovim config, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim 0.11+
- `git`
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` (for live grep via fzf-lua)
- Rust toolchain (`rustc`, `cargo`, `rustfmt`, `rust-analyzer`) if doing Rust dev

LSP servers and formatters are installed automatically by Mason on first launch,
and both plugins and Mason tools auto-update on every startup.

## Structure

```
init.lua
lua/
├── config/
│   ├── options.lua   -- editor settings
│   ├── keymaps.lua   -- keymaps (leader = Space)
│   ├── autocmds.lua  -- autocommands
│   └── lazy.lua       -- lazy.nvim bootstrap + auto-sync on startup
└── plugins/           -- one file per plugin, auto-loaded by lazy.nvim
```

## Highlights

- **Colorscheme:** tokyonight (transparent)
- **LSP:** mason + mason-lspconfig + nvim-lspconfig, auto-installing servers for
  Lua, C/C++, Python, Angular/TS, HTML/CSS, Rust
- **Completion:** nvim-cmp + LuaSnip
- **Formatting:** conform.nvim, format-on-save (stylua, clang-format, ruff, rustfmt)
- **Fuzzy finding:** fzf-lua (files, buffers, grep, LSP references)
- **File tree:** nvim-tree
- **Git:** gitsigns
- **Syntax:** nvim-treesitter (curated language list + auto-install on demand)
- **Rust:** rustaceanvim (rust-analyzer) + crates.nvim (Cargo.toml completion)
- **Debugging:** nvim-dap + nvim-dap-ui (codelldb, auto-installed by Mason)

## Key keymaps

Leader is `Space`. See [KEYMAPS.md](KEYMAPS.md) for the full list.

| Keys | Action |
|---|---|
| `<C-p>` | Find files |
| `<leader>/` | Live grep |
| `<leader>b` | Find buffers |
| `<leader>ee` | Toggle file explorer |
| `gd` / `gr` / `gf` | Go to definition / references / code actions |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Line diagnostics |
| `<leader>c` | Preview git hunk |
| `F5` / `F9` | Debug: continue / toggle breakpoint |
| `F10` / `F11` | Debug: step over / step into |
| `<leader>xu` | Debug: toggle UI |
| `S` | Save file |
| `vv` / `ss` | Vertical / horizontal split |
