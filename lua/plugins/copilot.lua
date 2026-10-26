-------------------------------------------------------------------------------
-- lua/plugins/copilot.lua - GitHub Copilot AI Assistance
-------------------------------------------------------------------------------
-- Pure Lua client (zbirenbaum/copilot.lua) for GitHub Copilot.
-- Provides non-intrusive inline ghost-text code completions without Node.js bloat.
--
-- Keymaps & Chords:
--   - <leader>ct : Toggle auto-trigger on/off dynamically
--   - <C-f>      : Accept suggested ghost text
--   - <C-j>      : Next suggestion
--   - <C-b>      : Previous suggestion
--   - <C-g>      : Dismiss suggestion
-------------------------------------------------------------------------------

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  keys = {
    {
      "<leader>ct",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
        local is_auto = vim.b.copilot_suggestion_auto_trigger
        if is_auto then
          vim.notify("Copilot Suggestions: Enabled", vim.log.levels.INFO)
        else
          vim.notify("Copilot Suggestions: Disabled", vim.log.levels.WARN)
        end
      end,
      desc = "Toggle Copilot Suggestions",
    },
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      debounce = 150,
      keymap = {
        accept = "<C-f>",
        next = "<C-j>",
        prev = "<C-b>",
        dismiss = "<C-g>",
      },
    },
    filetypes = {
      markdown = false,
      gitcommit = false,
      gitrebase = false,
      ["."] = false,
    },
    panel = { enabled = false },
  },
}
