-------------------------------------------------------------------------------
-- lua/plugins/obsidian.lua - Obsidian Knowledge Management Integration
-------------------------------------------------------------------------------
-- Integrates Neovim with Obsidian markdown vaults using obsidian-nvim.
--
-- Features:
--   - Navigation of markdown links (`[[note]]`) and backlinks
--   - Daily notes creation and templates
--   - Fast note searching and switching via fzf-lua
--   - Completion for notes via blink.cmp
--
-- Vault Customization:
--   Set the environment variable OBSIDIAN_VAULT_PATH to point to your vault,
--   or change the default path below (defaults to ~/obsidian-vault).
-------------------------------------------------------------------------------

local vault_path = vim.env.OBSIDIAN_VAULT_PATH or vim.fn.expand("~/obsidian-vault")

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "Obsidian" },
  event = {
    "BufReadPre " .. vault_path .. "/**",
    "BufNewFile " .. vault_path .. "/**",
  },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Obsidian Note" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Open Today's Note" },
    { "<leader>oi", "<cmd>Obsidian template<cr>", desc = "Insert Obsidian Template" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search Obsidian Notes" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Quick Switch Note" },
    { "<leader>of", "<cmd>Obsidian follow_link<cr>", desc = "Obsidian: Visit/Follow Link" },
    { "<leader>ol", "<cmd>Obsidian link<cr>", mode = { "n", "v" }, desc = "Obsidian: Link Existing Note" },
    { "<leader>oL", "<cmd>Obsidian link_new<cr>", mode = { "n", "v" }, desc = "Obsidian: Link New Note" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: Show Backlinks" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp",
    "ibhagwan/fzf-lua",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vault_path,
      },
    },
    legacy_commands = false,
    completion = {
      min_chars = 0, -- Show available notes immediately after typing '[['
    },
    picker = {
      name = "fzf-lua",
    },
    ui = {
      enable = false, -- Handled cleanly by render-markdown.nvim
    },
    daily_notes = {
      folder = "Journal/Daily",
      date_format = "%Y-%m-%d",
    },
  },
}
