-------------------------------------------------------------------------------
-- lua/plugins/fzf.lua - High-Performance Fuzzy Finding
-------------------------------------------------------------------------------
-- Powered by ibhagwan/fzf-lua. Provides asynchronous, lightning-fast fuzzy
-- search capabilities across project files, buffers, live greps, and help tags.
--
-- Features:
--   - Telescope profile styling with vertical split preview
--   - Registers as the default `vim.ui.select` handler
--   - Mini.icons integration for file icon rendering
--
-- Keymaps:
--   - <leader>ff : Find files
--   - <leader>fg : Live grep through project
--   - <leader>fr : Recent / old files
--   - <leader>fb : Open buffers
--   - <leader>fh : Neovim help tags
-------------------------------------------------------------------------------

return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.icons",
  },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files (fzf)" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (fzf)" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Old Files (fzf)" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers (fzf)" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags (fzf)" },
  },
  opts = {
    "telescope",
    winopts = {
      height = 0.95,
      width = 0.95,
      preview = {
        layout = "vertical",
        vertical = "down:65%",
      },
    },
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select()
  end,
}
