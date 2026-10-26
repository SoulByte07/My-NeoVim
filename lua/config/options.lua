-------------------------------------------------------------------------------
-- lua/config/options.lua - Core Editor Settings & Options
-------------------------------------------------------------------------------
-- Defines native Neovim behavior:
--   - Leader key assignments (<Space>)
--   - Indentation & tabs (4-space standard)
--   - UI rendering (relative numbers, scrolloff, termguicolors)
--   - Performance & latency optimizations (timeoutlen, updatetime)
--   - Search & incremental replacement preview
--   - Persistent undo across sessions
--   - Subtle native UI features (listchars indent guides, yank highlight)
-------------------------------------------------------------------------------

-- Leader key (must be set before loading plugins or keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation & Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Line numbers & UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.smoothscroll = true
vim.opt.scrolloff = 999
vim.opt.splitkeep = "screen"
vim.opt.confirm = true
vim.opt.inccommand = "split"
vim.opt.background = "dark"
vim.opt.pumheight = 10
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
vim.opt.termguicolors = true

-- Responsiveness & Snappiness
vim.opt.timeoutlen = 500 -- Instant key chords (down from 1000ms)
vim.opt.updatetime = 200 -- Fast CursorHold for diagnostics & git (down from 4000ms)

-- Sleek UI Polish
vim.opt.fillchars = { eob = " " } -- Removes ancient '~' tildes below file content
vim.opt.conceallevel = 2 -- Clean rendering for Markdown and Obsidian
vim.opt.concealcursor = "nc"

-- Clipboard (isolated so standard deletes don't clobber OS clipboard; keymaps.lua handles yanks)
vim.opt.clipboard = ""

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Command-line completion
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"

-- Persistent undo (safely enabled; Neovim automatically manages stdpath("state")/undo)
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000

-- Indent guides (native Neovim 0.10+ listchars)
vim.opt.list = true
vim.opt.listchars = {
  leadmultispace = "│   ",
  tab = "│ ",
  trail = "·",
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#45475a" })

-- Flash on Yank (150ms subtle visual confirmation on copy)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

-- Custom filetype detections
vim.filetype.add({
  pattern = {
    ["docker-compose%.ya?ml"] = "yaml.docker-compose",
    ["gitlab-ci%.ya?ml"] = "yaml.gitlab",
    ["values%.ya?ml"] = "yaml.helm-values",
  },
})
