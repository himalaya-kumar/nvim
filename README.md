# nvim config

A modular Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Requirements

- Neovim >= 0.10
- `git`, `make`, `unzip`, `rg` (ripgrep)
- Nerd Font (for icons)
- Language-specific tools (installed via Mason): `gopls`, `clangd`, `ts_ls`, `jdtls`, `lua_ls`, etc.

## Structure

```
├── init.lua                  # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua       # Core Neovim settings
│   │   ├── keymaps.lua       # Global key mappings
│   │   └── autocommands.lua  # Auto-commands (yank highlight)
│   ├── plugins.lua           # Plugin list (loaded by lazy.nvim)
│   ├── plugins/              # Individual plugin configs (17 files)
│   ├── themes/               # Theme configurations (11 themes)
│   ├── test/                 # Experimental configs
│   ├── lazySetup.lua         # lazy.nvim bootstrap
│   └── health.lua            # :checkhealth provider
├── tmux.conf                 # Tmux configuration
└── starship.toml             # Shell prompt config
```

## Boot Sequence

1. `init.lua` loads `config.options`, `config.autocommands`, `config.keymaps`, `health`, `lazySetup`
2. `lazySetup.lua` clones lazy.nvim if missing, then runs `require("lazy").setup("plugins")`
3. `plugins.lua` returns all plugin specs for lazy.nvim to install/configure

## Plugins

### Editor
| Plugin | Purpose |
|--------|---------|
| `nvim-autopairs` | Auto-close brackets/quotes |
| `guess-indent.nvim` | Auto-detect indentation |
| `nvim-surround` | Surround text objects (`ys`/`ds`/`cs`) |
| `todo-comments.nvim` | Highlight TODO/FIXME comments |

### UI
| Plugin | Purpose |
|--------|---------|
| `snacks.nvim` | Dashboard, indent guides, notifier, smooth scroll, word highlight |
| `nvim-tree.lua` | File explorer sidebar (`<C-n>`) |
| `oil.nvim` | Buffer-based file explorer (`-`) |
| `bufferline.nvim` | Buffer tabline (`<C-m>` prev, `<C-q>` close); NvimTree sidebar shows "File Explorer" label |
| `which-key.nvim` | Keymap discovery popup |
| `mini.nvim` | Statusline |

### Language & Tooling
| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` | LSP config data (Neovim 0.11 native `vim.lsp.config`/`vim.lsp.enable` API) |
| `blink.cmp` | Completion engine (LSP/path/snippets/buffer) |
| `nvim-treesitter` | Syntax highlighting & navigation |
| `conform.nvim` | Async formatting on save (`<leader>f`) |
| `nvim-lint` | Linting (markdownlint, checkmate) |
| `lazydev.nvim` | Lua LSP for Neovim config files |
| `fidget.nvim` | LSP progress UI |
| `nvim-dap` + `nvim-dap-ui` | Debugging (`<F5>`, `<F1>-<F3>`, `<leader>b`) |
| `nvim-dap-go` | Go debugger (delve) |

### Navigation
| Plugin | Purpose |
|--------|---------|
| `telescope.nvim` | Fuzzy finder (files, grep, LSP, buffers) |
| `telescope-fzf-native.nvim` | fzf sorting |
| `flash.nvim` | Leap-style jump navigation (`s` + 2 chars) |

### Git
| Plugin | Purpose |
|--------|---------|
| `gitsigns.nvim` | Gutter signs, hunk staging, blame |

### Package Management
| Plugin | Purpose |
|--------|---------|
| `lazy.nvim` | Plugin manager (bootstrapped) |
| `mason.nvim` | LSP/linter/debugger installer |
| `mason-tool-installer.nvim` | Auto-install Mason tools |

## Key Mappings

### Global
| Key | Action |
|-----|--------|
| `ii` (insert) | Escape |
| `ss` | Save buffer |
| `<C-j/k/h/l>` | Window navigation |
| `<C-d>` | Duplicate line |
| `<C-x>` | Delete line |
| `<C-t>` | Telescope live_grep |
| `<C-y>` | Telescope find_files |
| `<C-q>` | Close buffer |
| `<C-m>` | Previous buffer (bufferline) |
| `<C-\>` | Open terminal |
| `<C-n>` | NvimTree toggle |
| `<A-j/k>` | Move line up/down |

### Leader (`<Space>`)
| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |
| `<leader>b` / `<leader>B` | Toggle / conditional breakpoint |
| `<leader>h*` | Git operations (stage, reset, blame, diff) |
| `<leader>s*` | Telescope searches (help, files, grep, buffers, etc.) |
| `<leader>t*` | Toggles (blame, inlay hints, deleted lines) |

### LSP (buffer-local)
| Key | Action |
|-----|--------|
| `grn` | Rename |
| `gra` | Code action |
| `grr` | References |
| `grd` | Definition |
| `gri` | Implementation |
| `grt` | Type definition |
| `grD` | Declaration |
| `gW` | Workspace symbols |
| `gO` | Document symbols |
| `<leader>th` | Toggle inlay hints |

### Flash
| Key | Action |
|-----|--------|
| `s` (n/x/o) | Leap-style jump to any visible location |
| `S` (n/x/o) | Treesitter node selection |

### Debug
| Key | Action |
|-----|--------|
| `<F5>` | Continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |

## LSP Servers

| Server | Language | Features |
|--------|----------|---------|
| `clangd` | C, C++ | |
| `gopls` | Go | staticcheck, gofumpt |
| `ts_ls` | TypeScript, JS | Inlay hints |
| `jdtls` | Java | Lombok support |
| `lemminx` | XML | |
| `lua_ls` | Lua | Completion callSnippet |

## Themes

11 themes managed via `lua/themes/init.lua`. **Active: catppuccin** (mocha).

Switch by editing `lua/themes/init.lua` and changing `local active = "catppuccin"`.

Available: gruber-darker, gruvbox8, night-owl, gruvbox-material, tokyonight, kanagawa, rose-pine, everforest, cyberdream, mini.

## Commands

```vim
:Lazy        " Plugin manager UI
:Lazy sync   " Install/update plugins
:checkhealth " Verify dependencies
:TSUpdate    " Update tree-sitter grammars
:Mason       " Manage LSP/linter/debugger tools
```

## Notes

- LSP uses Neovim 0.11's native `vim.lsp.config`/`vim.lsp.enable` API (nvim-lspconfig provides config data)
- WSL clipboard is configured in `keymaps.lua` using `clip.exe` and PowerShell
- Format on save is disabled for C/C++ files (use `<leader>f` manually)
- All LSP servers and `stylua` auto-install via mason-tool-installer on first run
- Tmux config includes vim-tmux-navigator, tmux-resurrect/continuum, Dracula theme
