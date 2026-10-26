-------------------------------------------------------------------------------
-- lua/plugins/markdown.lua - Markdown Rendering & Live Preview
-------------------------------------------------------------------------------
-- Enhances Markdown authoring with two synergistic plugins:
--   1. MeanderingProgrammer/render-markdown.nvim: In-editor formatted view of
--      markdown tables, code callouts, checkboxes, and headers with anti-conceal.
--   2. brianhuster/live-preview.nvim: Real-time browser live preview with sync scrolling.
--
-- Keymaps:
--   - <leader>mp : Start browser live preview on port 5555
--   - <leader>mc : Close browser live preview
-------------------------------------------------------------------------------

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    cmd = { "RenderMarkdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    opts = {
      anti_conceal = { enabled = true },
      file_types = { "markdown" },
    },
  },
  {
    "brianhuster/live-preview.nvim",
    cmd = { "LivePreview" },
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>mp", "<cmd>LivePreview start<cr>", desc = "Start Browser Preview" },
      { "<leader>mc", "<cmd>LivePreview close<cr>", desc = "Close Browser Preview" },
    },
    opts = {
      port = 5555,
      browser = "chromium",
      sync_scroll = true,
      dynamic_root = true,
    },
  },
}
