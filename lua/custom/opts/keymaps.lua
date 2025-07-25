--[[

This file is used for setting keymaps

--]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quick exit
vim.keymap.set('n', '<C-w>.', '<cmd>qa<CR>', { desc = 'Exit Neovim [:qa]' })

-- Close buffer
vim.keymap.set('n', '<space>bd', function()
  require('mini.bufremove').delete(0, false)
end, { desc = '[B]uffer [D]elete' })

-- Saving
vim.keymap.set({ 'n', 'i' }, '<c-s>', '<cmd>w<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Use with bufferline
-- vim.keymap.set('n', 'H', function()
--   require('bufferline').cycle(-1)
-- end, { desc = 'Move to the previous buffer' })
-- vim.keymap.set('n', 'L', function()
--   require('bufferline').cycle(1)
-- end, { desc = 'Move to the next buffer' })

vim.keymap.set('n', '<a-h>', function()
  require('bufferline').move(-1)
end, { desc = 'Move buffer to the left' })

vim.keymap.set('n', '<a-l>', function()
  require('bufferline').move(1)
end, { desc = 'Move buffer to the right' })

-- Oil
vim.keymap.set('n', '<space>e', function()
  require('oil').toggle_float()
end, { desc = 'Open Oil' })
