-- Session manager
return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre', -- Ensure the plugin loads only when a buffer has been loaded
  config = function()
    vim.keymap.set('n', '<leader>Sa', '<cmd>SessionSave<CR>', { desc = 'S[a]ve session' })
    vim.keymap.set('n', '<leader>Ss', '<cmd>SessionSelect<CR>', { desc = '[s]elect session' })
    vim.keymap.set('n', '<leader>SD', '<cmd>SessionDelete<CR>', { desc = '[D]elete session' })

    require('persisted').setup {}
  end,
}
