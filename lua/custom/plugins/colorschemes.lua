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
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
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
}
