return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local logos = {
      {
        [[      ██ ███ █      ███████  ███      ███   ████ ]],
        [[     █  █ █   █  █ ██  █         █      ██ ]],
        [[󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞███████󰹞██󰹞󰹞󰹞󰹞█󰹞󰹞󰹞 󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞████󰹞󰹞󰹞󰹞󰹞]],
        [[ █  █ █      █   █    █        █   ███   ]],
        [[ ████████  █████ █   ███   ██  █     ██████    ]],
      },
      {
        [[██    ██ ██   ████████ ██████   █████  ██    ██ ██ ███    ███]],
        [[██    ██ ██      ██    ██   ██ ██   ██ ██    ██ ██ ████  ████]],
        [[██    ██ ██      ██    ██████  ███████ ██    ██ ██ ██ ████ ██]],
        [[██    ██ ██      ██    ██   ██ ██   ██  ██  ██  ██ ██  ██  ██]],
        [[ ██████  ███████ ██    ██   ██ ██   ██   ████   ██ ██      ██]],
      },
      {
        [[██╗   ██╗██╗  ████████╗██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[██║   ██║██║  ╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██║████╗ ████║]],
        [[██║   ██║██║     ██║   ██████╔╝███████║██║   ██║██║██╔████╔██║]],
        [[██║   ██║██║     ██║   ██╔══██╗██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[╚██████╔╝███████╗██║   ██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[ ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    }

    local current_logo = 1

    dashboard.section.header.val = logos[current_logo]

    dashboard.section.header.opts.hl = 'Function'
    dashboard.section.buttons.val = {
      dashboard.button('n', 'New file', '<cmd>ene<CR>'),
      dashboard.button('b', 'Browse files', '<cmd>Oil<CR>'),
      dashboard.button('f', 'Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('g', 'Find text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('r', 'Find recent files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('s', 'Select a session', '<cmd>SessionSelect<CR>'),
      dashboard.button('q', 'Exit ULTRAVIM', '<cmd>qa<CR>'),
    }

    alpha.setup(dashboard.config)

    vim.api.nvim_create_user_command('CycleLogo', function()
      current_logo = current_logo % #logos + 1
      dashboard.section.header.val = logos[current_logo]
      alpha.setup(dashboard.config)
      vim.cmd 'AlphaRedraw'
    end, {})
  end,
}
