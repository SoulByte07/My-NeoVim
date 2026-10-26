-------------------------------------------------------------------------------
-- lua/plugins/noice.lua - Modern UI Replacement
-------------------------------------------------------------------------------
-- folke/noice.nvim modernizes Neovim's UI:
--   - Floating cmdline and search popups with sleek icons
--   - Notification handling and mini message router
--   - Suppressed notification noise (file write confirmations, search counts)
--   - <Esc> convenience mapping to clear highlights and dismiss notifications
-------------------------------------------------------------------------------

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = { icon = "󰘳" },
        search_down = { icon = "" },
        search_up = { icon = "" },
      },
    },
    messages = {
      enabled = true,
      view = "mini",
    },
    lsp = {
      progress = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    -- Dismiss notifications and clear search highlights with Esc
    vim.keymap.set("n", "<esc>", function()
      vim.cmd("nohlsearch")
      pcall(function()
        require("noice").cmd("dismiss")
      end)
      return "<esc>"
    end, { expr = true, desc = "Dismiss Noice and clear search highlights" })
  end,
}
