-------------------------------------------------------------------------------
-- lua/plugins/flash.lua - Fast Code Navigation & Motions
-------------------------------------------------------------------------------
-- folke/flash.nvim provides label-based navigation across the visible window.
-- Allows jumping directly to any word or location with 2-3 keystrokes.
--
-- Keymaps:
--   - 'f' (Normal / Visual mode) : Trigger Flash Jump labels
--   Note: <leader>f is mapped in lua/config/keymaps.lua to access native 'f' char find.
-------------------------------------------------------------------------------

return {
  "folke/flash.nvim",
  cmd = "Flash",
  keys = {
    {
      "f",
      mode = { "n", "x" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
  },
  opts = {
    modes = {
      char = {
        enabled = false, -- Disable flash from overriding native f/t character search
      },
    },
  },
}
