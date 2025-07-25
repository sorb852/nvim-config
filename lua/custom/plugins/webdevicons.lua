return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    priority = 2000,
    config = function()
      require('nvim-web-devicons').setup {
        color_icons = true,
        default = false,
      }
    end,
  },
}
