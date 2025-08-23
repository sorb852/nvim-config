local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('FriendInit', function(opts)
    if opts.fargs[1] == nil then
      error "You can't have friend without name, wouldn't you?"
    end
    require('friend.floating').setup { friend_name = opts.fargs[1] }
  end, { nargs = 1 })

  vim.api.nvim_create_user_command('FriendSetMessage', function(opts)
    if opts.fargs[1] ~= nil then
      require('friend.floating').set_message(opts.fargs[1])
    else
      error 'Please provide a message'
    end
  end, { nargs = 1 })

  vim.api.nvim_create_user_command('FriendTypeMessage', function(opts)
    if opts.fargs[1] ~= nil then
      require('friend.floating').type_message(opts.fargs[1])
    else
      error 'Please provide a message'
    end
  end, { nargs = 1 })
end

return M
