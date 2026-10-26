-------------------------------------------------------------------------------
-- lua/plugins/grapple.lua - Scoped Buffer Bookmarking
-------------------------------------------------------------------------------
-- cbochs/grapple.nvim allows tagging and jumping between important project files.
-- Bookmarks are scoped automatically to your active git branch.
--
-- Keymaps:
--   - <leader>a : Toggle bookmark / pin on active file
--   - <C-e>     : Open quick menu popup of bookmarked files
--   - <M-1>..<M-5> (or Alt+1..Alt+5) : Jump directly to pinned files 1 to 5
-------------------------------------------------------------------------------

return {
  "cbochs/grapple.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Grapple" },
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    scope = "git_branch",
    status = {
      icon = "󰛢 ",
    },
  },
  keys = {
    -- Toggle pin on current buffer
    { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Grapple: Toggle Pin Current File" },
    -- Open quick menu / tag list
    { "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple: Toggle Quick Menu" },
    -- Jump directly to pins 1..5
    { "<M-1>", "<cmd>Grapple select index=1<cr>", desc = "Grapple Pin 1" },
    { "<M-2>", "<cmd>Grapple select index=2<cr>", desc = "Grapple Pin 2" },
    { "<M-3>", "<cmd>Grapple select index=3<cr>", desc = "Grapple Pin 3" },
    { "<M-4>", "<cmd>Grapple select index=4<cr>", desc = "Grapple Pin 4" },
    { "<M-5>", "<cmd>Grapple select index=5<cr>", desc = "Grapple Pin 5" },
    -- Fallback mappings for terminals recognizing <A-*>
    { "<A-1>", "<cmd>Grapple select index=1<cr>", desc = "Grapple Pin 1" },
    { "<A-2>", "<cmd>Grapple select index=2<cr>", desc = "Grapple Pin 2" },
    { "<A-3>", "<cmd>Grapple select index=3<cr>", desc = "Grapple Pin 3" },
    { "<A-4>", "<cmd>Grapple select index=4<cr>", desc = "Grapple Pin 4" },
    { "<A-5>", "<cmd>Grapple select index=5<cr>", desc = "Grapple Pin 5" },
  },
}
