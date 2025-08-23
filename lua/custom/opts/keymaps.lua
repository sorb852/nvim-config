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
vim.keymap.set('n', '<leader>bd', function()
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

--- @alias FileExplorerOptions
--- | 'neo-tree'
--- | 'oil'

--- @type FileExplorerOptions
local current = 'oil'

vim.api.nvim_create_user_command('SetFileExplorer', function(opts)
  if opts.fargs[1] == 'neo-tree' then
    current = 'neo-tree'
  elseif opts.fargs[1] == 'oil' then
    current = 'oil'
  else
    error 'Please provide a valid file explorer'
  end
end, { nargs = 1 })

vim.api.nvim_create_user_command('ToggleFileExplorer', function()
  if current == 'neo-tree' then
    vim.cmd 'Neotree close'
    current = 'oil'
  else
    current = 'neo-tree'
  end
end, {})

-- Oil
vim.keymap.set('n', '<leader>e', function()
  if current == 'oil' then
    require('oil').toggle_float()
  else
    vim.cmd 'Neotree reveal'
  end
end, { desc = 'Open file explorer' })
