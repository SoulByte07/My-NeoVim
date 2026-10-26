-------------------------------------------------------------------------------
-- lua/plugins/oil.lua - Buffer-based File Manager
-------------------------------------------------------------------------------
-- stevearc/oil.nvim lets you edit your filesystem like a normal Neovim buffer.
-- Create, rename, move, and delete files directly using standard buffer edits.
--
-- Keymaps:
--   - '-' : Toggle Oil floating file explorer
-------------------------------------------------------------------------------

return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    {
      "-",
      function()
        require("oil").toggle_float()
      end,
      desc = "Toggle Oil floating file manager",
    },
  },
  opts = {
    default_file_explorer = true,
  },
}
