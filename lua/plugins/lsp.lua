-------------------------------------------------------------------------------
-- lua/plugins/lsp.lua - Language Server Protocol (LSP) Configuration
-------------------------------------------------------------------------------
-- Orchestrates LSP support using:
--   - williamboman/mason.nvim: Automatic binary manager for LSPs & tools
--   - williamboman/mason-lspconfig.nvim: Bridges Mason with nvim-lspconfig
--   - neovim/nvim-lspconfig: Predefined configurations for language servers
--   - saghen/blink.cmp: Capability injection for high-speed completions
--
-- Installed Servers: ts_ls, html, lua_ls, gopls
-- Installed Formatters/Linters: stylua, prettier
--
-- Keymaps (when LSP attaches to a buffer):
--   - 'K'         : Show documentation hover popup
--   - 'gd'        : Go to definition
--   - 'gr'        : Find all references
--   - '<leader>ca': Trigger code action
--   - '<leader>rn': Rename symbol
--   - '<leader>gl': Show diagnostic floating window for current line
-------------------------------------------------------------------------------

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = { "stylua", "prettier" },
      },
    },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- Diagnostic signs & styling
    local diagnostic_icons = {
      [vim.diagnostic.severity.ERROR] = "✖",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "ⓘ",
    }

    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = "",
        format = function(diagnostic)
          local icon = diagnostic_icons[diagnostic.severity] or ""
          return string.format("%s %s", icon, diagnostic.message)
        end,
      },
      signs = { text = diagnostic_icons },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = " ",
      },
    })

    -- Diagnostic keymaps
    vim.keymap.set("n", "<leader>gl", function()
      vim.diagnostic.open_float({ border = "rounded", scope = "line" })
    end, { desc = "Show line diagnostic" })

    -- LSP keybindings on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "html", "lua_ls", "gopls" },
      automatic_installation = true,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                  library = { vim.env.VIMRUNTIME },
                },
                telemetry = { enable = false },
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
