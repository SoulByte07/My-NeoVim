-------------------------------------------------------------------------------
-- lua/config/lazy.lua - Plugin Manager Bootstrap & Setup
-------------------------------------------------------------------------------
-- Bootstraps folke/lazy.nvim if not already installed, then initializes
-- the plugin ecosystem by scanning and loading specifications from lua/plugins/.
--
-- Optimization settings:
--   - Lazy loading by default (defaults.lazy = true)
--   - Disabled unused built-in Vim plugins (netrw, matchit, tutor, etc.)
--   - Disabled noisy change detection to ensure smooth and distraction-free editing
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  defaults = { lazy = true },
  checker = { enabled = true, notify = false },
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
})
