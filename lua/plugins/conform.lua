-------------------------------------------------------------------------------
-- lua/plugins/conform.lua - Fast, Async Code Formatting
-------------------------------------------------------------------------------
-- stevearc/conform.nvim provides fast, reliable code formatting with fallback
-- to LSP formatting if external CLI tools are not available.
--
-- Configured Formatters:
--   - Lua: Stylua
--   - Web / JSON / YAML / Markdown: Prettier
--
-- Keymaps:
--   - <leader>cf (Normal / Visual) : Format current buffer or selected range
-------------------------------------------------------------------------------

return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
  },
}
