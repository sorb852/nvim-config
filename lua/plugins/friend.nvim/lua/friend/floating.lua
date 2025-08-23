local M = {}

local buf
local win

function M.setup(opts)
  if not buf or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true) -- scratch buffer
  end

  if not win or not vim.api.nvim_win_is_valid(win) then
    local win_opts = {
      relative = 'editor',
      focusable = false,
      mouse = false,

      width = opts.width or 30,
      height = 1,
      row = vim.o.lines - 8,
      col = vim.o.columns - (opts.width or 30) - 3,

      style = 'minimal',
      border = 'rounded',
      title = opts.friend_name,
      title_pos = 'left',
    }
    win = vim.api.nvim_open_win(buf, false, win_opts)
  end
end

function M.set_message(msg)
  if buf and vim.api.nvim_buf_is_valid(buf) then
    local lines = M.wrap_text(msg, vim.api.nvim_win_get_width(win))
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_win_set_height(win, #lines - 1)
  end
end

function M.type_message(msg, delay)
  delay = delay or 50
  local i = 0

  local function step()
    if i <= #msg then
      M.set_message(msg:sub(1, i))
      i = i + 1
      vim.defer_fn(step, delay)
    end
  end

  step()
end

function M.wrap_text(text, width)
  local lines = {}
  for line in text:gmatch '([^\n]*)\n?' do
    while #line > width do
      table.insert(lines, line:sub(1, width))
      line = line:sub(width + 1)
    end
    table.insert(lines, line)
  end
  return lines
end

return M
