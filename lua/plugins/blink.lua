-------------------------------------------------------------------------------
-- lua/plugins/blink.lua - Next-Generation Completion Engine
-------------------------------------------------------------------------------
-- Configures saghen/blink.cmp, a blazing fast completion engine written in Rust.
--
-- Features:
--   - Sources: LSP, filesystem paths, snippets, and active buffer words
--   - Snappy fuzzy matching engine ("prefer_rust")
--   - Automatic documentation hover window with rounded borders
--   - Built-in signature help support
--   - Out-of-the-box snippet integration via friendly-snippets
-------------------------------------------------------------------------------

return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        window = { border = "rounded" },
      },
      menu = {
        border = "rounded",
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
    fuzzy = {
      implementation = "prefer_rust",
    },
  },
}
