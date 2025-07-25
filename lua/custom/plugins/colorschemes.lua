-- All the colorschemesyou want
-- Also set default colorscheme here
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      styles = {
        comments = {
          italic = false,
        },
      },
    },
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      -- vim.cmd.colorscheme 'tokyonight'
      -- vim.cmd.colorscheme 'gruvbox-material'
      vim.cmd.colorscheme 'cooltestcs'
    end,
  },

  {
    'vague2k/vague.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      styles = {
        comments = {
          italic = false,
        },
      },
    },
  },
  {
    dir = '/home/sorb852/.config/nvim-custom-cs/cooltestcs/',
    priority = 1000,
  },
}
