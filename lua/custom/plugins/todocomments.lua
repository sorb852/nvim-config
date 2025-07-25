-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo = require 'todo-comments'
    todo.setup {
      signs = false,
      colors = {
        error = { '@comment.error' },
        warning = { '@comment.warning' },
        info = { '@comment.note' },
        hint = { '@comment.note' },
      },
    }
  end,
}
