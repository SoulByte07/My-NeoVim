-------------------------------------------------------------------------------
-- lua/plugins/lualine.lua - Aesthetic Statusline
-------------------------------------------------------------------------------
-- Configures nvim-lualine/lualine.nvim with Catppuccin Mocha theme integration.
--
-- Features:
--   - Global statusline (globalstatus = true)
--   - Rounded bubble capsule separators ( / )
--   - Active filename, Git branch, search counter pill, and LSP diagnostics
--   - Integrates with mini.icons via mock_nvim_web_devicons
-------------------------------------------------------------------------------

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },
  init = function()
    local ok, mini_icons = pcall(require, "mini.icons")
    if ok then
      mini_icons.mock_nvim_web_devicons()
    end
  end,
  opts = function()
    -- Uses Catppuccin's official lualine utility, respecting transparent_background
    local catppuccin_theme = require("catppuccin.utils.lualine")("mocha")
    local ctp_colors = require("catppuccin.palettes").get_palette("mocha")

    return {
      options = {
        theme = catppuccin_theme,
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "lazy" },
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" } },
        },
        lualine_b = {
          { "filename", file_status = true, path = 0 },
          { "branch", icon = "" },
        },
        lualine_c = {
          "%=",
        },
        lualine_x = {
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
            icon = "",
            color = { bg = ctp_colors.blue, fg = ctp_colors.mantle, gui = "bold" },
            separator = { left = "", right = "" },
          },
          {
            "diagnostics",
            symbols = { error = "✖ ", warn = " ", info = "ⓘ ", hint = " " },
          },
        },
        lualine_y = {
          "filetype",
          "progress",
        },
        lualine_z = {
          { "location", separator = { left = "", right = "" } },
        },
      },
    }
  end,
}
