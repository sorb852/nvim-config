--- Closes the specified buffer
---@param bufnum number
local function close(bufnum)
  require('mini.bufremove').delete(bufnum)
end

-- Plugin for buffer line
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      close_command = close,
      right_mouse_command = close,
      indicator = {
        style = 'underline',
      },
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
      },
      separator_style = 'slope',
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
    },
  },
}
