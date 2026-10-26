# ⚡ Aesthetic, Blazing-Fast Neovim Configuration

A modern, streamlined, and modular Neovim configuration built for speed, aesthetics, and developer productivity. Powered by **Lazy.nvim**, **Blink.cmp**, **Treesitter**, and **Native LSP**.

---

## ⚡ Performance & Executive Flex

### The Executive Flex Summary
```text
Startup Time Comparison (Lower is Faster)
────────────────────────────────────────────────────────────────────────
Your Setup           ██▍  16.6 ms
AstroNvim / LazyVim  ████████████▍  80 – 120 ms
Heavy Custom Config  ████████████████████  150 – 250 ms
VS Code (Cold Start) ████████████████████████████████████████  1,800 – 3,200 ms
────────────────────────────────────────────────────────────────────────
```

#### 1. Real Benchmark Numbers

- **Startup Speed**: `16.6 ms` (0.016 seconds) — faster than a single monitor refresh frame at 60Hz.
- **Active Startup Footprint**: `3 / 28` plugins (89.3% of plugins are deferred strictly on-demand).
- **Key Chord Delay (`timeoutlen`)**: `300 ms` (down from standard 1,000ms delay).
- **Diagnostics Reaction (`updatetime`)**: `200 ms` (20× faster than standard 4,000ms delay).

#### 2. Architecture Highlights

- **Zero Idle Waste**: Heavy daemons like GitHub Copilot (Node.js) never run on startup or idle — they spawn strictly when toggled with `<leader>ct`.
- **Rust-Powered Autocompletion**: Uses `blink.cmp`'s Rust-compiled fuzzy matching algorithm instead of heavy Lua loop evaluators.
- **Bytecode Caching**: Powered by Neovim v0.12 Nightly with native `vim.loader` disk bytecode compilation and native `vim.treesitter.start`.
- **Contiguous Pin Switcher**: Fast buffer tagging tracks your key files and auto-compacts gaps for instant jumping via <kbd>Alt+1</kbd>..<kbd>Alt+5</kbd>.

#### 3. Shareable Dotfiles Badge

> ### ⚡ Neovim 0.12 Nightly Specs
> - ⏱️ **Cold Startup**: ~16.6 ms
> - 📦 **Boot Plugin Footprint**: 3 / 28 (89% deferred)
> - 🎨 **Theme**: Catppuccin Mocha + Transparent Background + Pill Lualine
> - 🧠 **AI**: GitHub Copilot (on-demand toggle via `<leader>ct`, zero idle RAM)
> - 🔍 **Fuzzy Engine**: Rust-native `blink.cmp` + `fzf-native`
> - 📑 **Navigation**: Harpoon v2 / Grapple (5-pin contiguous order, `Alt+1..5`)
> - 🛠️ **Diagnostics**: Trouble / Native LSP floating drawer

---

## ✨ Features

- 🚀 **Blazing Fast**: Bytecode compilation cached via `vim.loader`, lazy-loading on demand, instant startup times (<30ms).
- 🎨 **Aesthetic UI**: Catppuccin Mocha theme with true transparency support, sleek lualine statusbar, and Noice floating popups.
- ⚡ **Next-Gen Completion**: Powered by [blink.cmp](https://github.com/saghen/blink.cmp) (Rust-backed fuzzy matching) with friendly-snippets.
- 🛠️ **Native LSP & Mason**: Auto-installs language servers and formatters (`ts_ls`, `gopls`, `lua_ls`, `html`, `prettier`, `stylua`).
- 🔍 **Ultra-Fast Search**: High-performance fuzzy finder with [fzf-lua](https://github.com/ibhagwan/fzf-lua) and live preview.
- 🗂️ **Buffer-based File Manager**: [oil.nvim](https://github.com/stevearc/oil.nvim) for editing directory trees as editable text buffers.
- 📍 **Scoped Bookmarking**: Harpoon alternative with [grapple.nvim](https://github.com/cbochs/grapple.nvim) scoped to your Git branch.
- 🤖 **AI Ready**: Clean inline GitHub Copilot integration ([copilot.lua](https://github.com/zbirenbaum/copilot.lua)) with quick trigger toggle.
- 📝 **Markdown & Knowledge Base**: Real-time browser preview, aesthetic table/callout rendering, and optional [obsidian.nvim](https://github.com/obsidian-nvim/obsidian.nvim) integration.

---

## 📋 Prerequisites

Ensure you have the following installed on your system:

| Tool | Version / Details | Purpose |
| :--- | :--- | :--- |
| **Neovim** | `>= 0.10.0` | Core editor (0.10+ required for native comments & diagnostic API) |
| **Git** | `>= 2.19.0` | Plugin management via Lazy.nvim |
| **Nerd Font** | v3.0+ (JetBrainsMono, FiraCode, etc.) | Icons in UI, Statusline, and File Explorer |
| **ripgrep** | Latest | Required for project-wide live grep (`fzf-lua`) |
| **fzf** | Latest | Command-line fuzzy finder |
| **Node.js & npm** | LTS | For Mason language servers (`ts_ls`, `prettier`, etc.) |
| **GCC / Clang** | C compiler | For compiling Treesitter parsers |

---

## 📦 Installation

### 1. Backup Existing Configuration (Optional)
If you already have a Neovim setup, back it up first:
```bash
# Backup existing nvim directory
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone the Repository
```bash
git clone https://github.com/SoulByte07/My-NeoVim.git ~/.config/nvim
```

### 3. Launch Neovim
```bash
nvim
```
*`lazy.nvim` will automatically bootstrap itself and install all required plugins. Mason will proceed to download LSPs and formatters in the background.*

---

## 📁 Repository Structure

```
~/.config/nvim
├── init.lua                  # Primary entry point (loads loader, options, lazy, keymaps)
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # Lazy.nvim package manager bootstrap & settings
│   │   ├── options.lua       # Native Neovim options, indentation, UI settings
│   │   └── keymaps.lua       # Global keybindings, clipboard integration, motions
│   └── plugins/
│       ├── blink.lua         # Next-gen Rust-based completion engine
│       ├── catppuccin.lua    # Colorscheme and highlight customizations
│       ├── conform.lua       # Formatter runner (Stylua, Prettier)
│       ├── copilot.lua       # GitHub Copilot integration & auto-trigger toggle
│       ├── flash.lua         # Rapid search-and-jump motions
│       ├── fzf.lua           # Project fuzzy finder & live grep
│       ├── grapple.lua       # Buffer bookmarks tagged per git branch
│       ├── lsp.lua           # LSP client setup, diagnostics, and Mason
│       ├── lualine.lua       # Bubble capsule statusline
│       ├── markdown.lua      # Markdown rendering & live browser preview
│       ├── mini-pair.lua     # Autopairs and keyword/hex color highlighter
│       ├── noice.lua         # Modern floating cmdline and message UI
│       ├── obsidian.lua      # Obsidian vault integration
│       ├── oil.lua           # File explorer as editable buffer
│       └── treesitter.lua    # AST parsing, code highlighting & indenting
└── snippets/                 # Custom user snippets (Lua, Markdown, Python)
```

---

## ⌨️ Essential Keybindings

The **Leader** key is mapped to <kbd>Space</kbd>.

### 🗂️ File Management & Navigation
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>-</kbd> | Normal | Toggle floating Oil file manager |
| <kbd>f</kbd> | Normal / Visual | Jump anywhere with Flash |
| <kbd>Space</kbd> <kbd>f</kbd> | Normal | Native single-char find forwards |
| <kbd>e</kbd> | Normal / Visual | Jump to end of line |
| <kbd>W</kbd> | Normal / Visual | Jump to end of word |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | Normal | Vertical window split |

### 🔍 Fuzzy Finder (`fzf-lua`)
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>Space</kbd> <kbd>f</kbd> <kbd>f</kbd> | Normal | Find project files |
| <kbd>Space</kbd> <kbd>f</kbd> <kbd>g</kbd> | Normal | Live grep text in project |
| <kbd>Space</kbd> <kbd>f</kbd> <kbd>b</kbd> | Normal | Switch open buffers |
| <kbd>Space</kbd> <kbd>f</kbd> <kbd>r</kbd> | Normal | Recent / old files |
| <kbd>Space</kbd> <kbd>f</kbd> <kbd>h</kbd> | Normal | Search Neovim help tags |

### 📍 Bookmarks (`Grapple`)
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>Space</kbd> <kbd>a</kbd> | Normal | Toggle pin / bookmark on active file |
| <kbd>Ctrl</kbd> + <kbd>e</kbd> | Normal | Toggle quick bookmark list menu |
| <kbd>Alt</kbd> + <kbd>1</kbd> .. <kbd>5</kbd> | Normal | Jump directly to pinned file 1–5 |

### 🛠️ LSP & Code Intelligence
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>K</kbd> | Normal | Show hover documentation |
| <kbd>g</kbd> <kbd>d</kbd> | Normal | Go to definition |
| <kbd>g</kbd> <kbd>r</kbd> | Normal | Find all references |
| <kbd>Space</kbd> <kbd>c</kbd> <kbd>a</kbd> | Normal | Code actions |
| <kbd>Space</kbd> <kbd>r</kbd> <kbd>n</kbd> | Normal | Rename symbol |
| <kbd>Space</kbd> <kbd>g</kbd> <kbd>l</kbd> | Normal | Show line diagnostics floating window |
| <kbd>Space</kbd> <kbd>c</kbd> <kbd>f</kbd> | Normal / Visual | Format buffer or selection |

### 📋 Clipboard & Editing
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>y</kbd> / <kbd>yy</kbd> / <kbd>Y</kbd> | Normal / Visual | Yank directly to system clipboard |
| <kbd>p</kbd> / <kbd>P</kbd> | Normal / Visual | Paste directly from system clipboard |
| <kbd>J</kbd> / <kbd>K</kbd> | Visual | Drag selected lines down / up |
| <kbd>c</kbd> <kbd>c</kbd> | Normal / Visual | Toggle comment line / selection |
| <kbd>Space</kbd> <kbd>s</kbd> | Normal / Visual | Interactive search and replace word/selection |
| <kbd>Space</kbd> <kbd>h</kbd> | Normal | Clear active search highlights |
| <kbd>Space</kbd> <kbd>x</kbd> | Normal | Make current file executable (`chmod +x`) |

### 🤖 Copilot & Markdown
| Keybinding | Mode | Description |
| :--- | :--- | :--- |
| <kbd>Space</kbd> <kbd>c</kbd> <kbd>t</kbd> | Normal | Toggle Copilot ghost text auto-trigger |
| <kbd>Ctrl</kbd> + <kbd>f</kbd> | Insert | Accept Copilot suggestion |
| <kbd>Ctrl</kbd> + <kbd>j</kbd> / <kbd>b</kbd> | Insert | Next / Previous Copilot suggestion |
| <kbd>Space</kbd> <kbd>m</kbd> <kbd>p</kbd> | Normal | Start live markdown browser preview |
| <kbd>Space</kbd> <kbd>m</kbd> <kbd>c</kbd> | Normal | Close live markdown browser preview |

---

## ⚙️ Customization

### Configuring Your Obsidian Vault Path
By default, the Obsidian plugin points to `~/obsidian-vault`. You can configure your vault in one of two ways:

1. **Environment Variable (Recommended)**:
   Add this to your `~/.bashrc` or `~/.zshrc`:
   ```bash
   export OBSIDIAN_VAULT_PATH="$HOME/Documents/MyVault"
   ```
2. **In Configuration**:
   Open `lua/plugins/obsidian.lua` and adjust the default fallback path:
   ```lua
   local vault_path = vim.env.OBSIDIAN_VAULT_PATH or vim.fn.expand("~/path/to/your/vault")
   ```

### Adding New Language Servers
To add support for other languages (e.g. Python, Rust, C++):
1. Open `lua/plugins/lsp.lua`.
2. Add your server name to `ensure_installed` under `mason-lspconfig` (e.g. `"pyright"`, `"rust_analyzer"`).
3. If formatting is needed, add the formatter to `ensure_installed` in Mason and configure it in `lua/plugins/conform.lua`.

---

## 📜 License
This configuration is released under the [MIT License](LICENSE). Feel free to fork, adapt, and make it your own!
