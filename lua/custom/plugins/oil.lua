return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      -- ['H'] = { 'actions.parent', mode = 'n' },
      -- ['L'] = 'actions.select',
      ['<BS>'] = { 'actions.parent', mode = 'n' },
      -- ['gq'] = {
      --   callback = function()
      --     require('oil').close()
      --   end,
      --   desc = 'Exit oil',
      --   mode = 'n',
      -- },
      ['gq'] = { 'actions.close', mode = 'n' },
    },
    default_file_explorer = true,
    columns = {
      'icon',
    },
    float = {
      padding = 2,
      max_height = 0.8,
      max_width = 0.8,
      border = 'rounded',
      win_options = {
        -- winblend = 20,
        winblend = 0,
      },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
}
