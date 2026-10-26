-------------------------------------------------------------------------------
-- lua/plugins/mini-pair.lua - Mini Ecosystem Utilities
-------------------------------------------------------------------------------
-- Employs modules from echasnovski/mini.nvim:
--   1. mini.pairs: Intelligent, zero-overhead autopairing for parentheses,
--      brackets, and quotes.
--   2. mini.hipatterns: Fast keyword highlighting (TODO, FIXME, NOTE, HACK, WARNING)
--      and inline color previews for hex values (e.g. #45475a).
-------------------------------------------------------------------------------

return {
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.hipatterns",
    version = false,
    event = "VeryLazy",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          warn = { pattern = "%f[%w]()WARNING()%f[%W]", group = "MiniHipatternsHack" },
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
