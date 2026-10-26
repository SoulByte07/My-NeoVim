-------------------------------------------------------------------------------
-- lua/plugins/catppuccin.lua - Aesthetic Colorscheme
-------------------------------------------------------------------------------
-- Sets up the Catppuccin Mocha theme with:
--   - Transparent background support
--   - Contrast tuning for line numbers
--   - Seamless integration with blink.cmp, treesitter, notify, mini, and fzf
-------------------------------------------------------------------------------

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.subtext0 },
        }
      end,
      integrations = {
        blink_cmp = true,
        treesitter = true,
        notify = true,
        mini = true,
        fzf = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
