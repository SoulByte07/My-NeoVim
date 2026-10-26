-------------------------------------------------------------------------------
-- init.lua - Neovim Main Configuration Entry Point
-------------------------------------------------------------------------------
-- Architecture & Boot Sequence:
--   1. Enable Lua bytecode cache (vim.loader) for faster startup times.
--   2. Load core editor options (lua/config/options.lua).
--   3. Bootstrap and initialize lazy.nvim plugin manager (lua/config/lazy.lua).
--   4. Load global key mappings and chords (lua/config/keymaps.lua).
-------------------------------------------------------------------------------

if vim.loader then
  vim.loader.enable()
end

require("config.options")
require("config.lazy")
require("config.keymaps")
