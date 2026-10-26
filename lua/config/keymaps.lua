-------------------------------------------------------------------------------
-- lua/config/keymaps.lua - Global Key Mappings
-------------------------------------------------------------------------------
-- Defines general shortcuts, ergonomics, and workflow enhancements:
--   - Window management (<C-S> for vertical splits)
--   - Ergonomic line movements ('e' for end-of-line, 'W' for end-of-word)
--   - Line dragging in visual mode (J/K)
--   - Centered viewport jumps (<C-d>, <C-u>, n, N)
--   - Interactive search & replace (<leader>s in normal and visual)
--   - Native commenting shortcuts (cc toggles comment)
--   - Seamless system clipboard integration (y/p use clipboard '+')
--   - Quick file execution permissions (<leader>x)
-------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Vertical split
vim.keymap.set("n", "<C-S>", "<C-w>v", opts)

-- Remove search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear Highlights" })

-- Ergonomic Navigation:
-- Remap 'e' to end-of-line and 'W' to end-of-word
vim.keymap.set({ "n", "v", "x" }, "e", "$", { noremap = true, silent = true, desc = "Go to end of line" })
vim.keymap.set({ "n", "v", "o" }, "W", "e", { noremap = true, silent = true, desc = "Move to end of word" })

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Center cursor on half-page scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Center cursor on search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = "Search & replace word under cursor" })
-- Search and replace the selected string
vim.keymap.set("v", "<leader>s", [[y:%s/<C-r>"/<C-r>"/gc<Left><Left><Left>]], { desc = "Search & replace selection" })

-- Native Neovim 0.10+ Commenting
vim.keymap.set("n", "cc", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "cc", "gc", { remap = true, desc = "Toggle Comment" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Visual Block Mode shortcut
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

-- ==========================================
-- Native System Clipboard Integration
-- ==========================================
-- 'y' / 'yy' / 'Y' copies to system clipboard
vim.keymap.set({ "n", "x" }, "y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "yy", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set("n", "Y", '"+Y', { desc = "Yank line to system clipboard" })

-- 'p' / 'P' pastes from system clipboard
vim.keymap.set({ "n", "x" }, "p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "P", '"+P', { desc = "Paste before from system clipboard" })

-- Visual mode paste without clobbering clipboard
vim.keymap.set("x", "p", '"+P', { desc = "Paste over selection without clobbering" })

-- Delete word to the left in insert mode (Ctrl+Backspace / Ctrl+h)
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word to the left" })
vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "Delete word to the left" })

-- Find next char (re-expose native 'f' since 'f' is bound to Flash)
vim.keymap.set("n", "<leader>f", "f", { desc = "Find next char (native f)" })
