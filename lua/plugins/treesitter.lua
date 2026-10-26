-------------------------------------------------------------------------------
-- lua/plugins/treesitter.lua - Syntax Highlighting & AST Parsing
-------------------------------------------------------------------------------
-- Configures nvim-treesitter for semantic code analysis, context-aware
-- syntax highlighting, and intelligent indentation.
--
-- Features:
--   - Automatically ensures parsers for core languages are installed
--   - Dual compatibility: handles both classic (master branch) and modern
--     (nvim-treesitter main branch / Neovim 0.12+ native) setups gracefully
-------------------------------------------------------------------------------

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall" },
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash",
      "go",
      "javascript",
      "jsdoc",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "typescript",
      "vim",
      "vimdoc",
    }

    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if ok then
      -- Classic / master branch setup
      configs.setup({
        ensure_installed = parsers,
        highlight = { enable = true },
        indent = { enable = true },
      })
    else
      -- Modern main branch setup (Neovim 0.12+)
      local ts = require("nvim-treesitter")
      ts.setup({})
      pcall(ts.install, parsers)

      -- Enable native Treesitter highlighting for buffers
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterAutoStart", { clear = true }),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end
  end,
}
