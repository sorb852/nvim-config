-- Autocompletion
return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      opts = {},
    },
    'folke/lazydev.nvim',
    {
      'Exafunction/codeium.nvim',
    },
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      -- You can press <c-space> to show documentation of the suggestion
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },

    sources = {
      -- yo codeium can you combine the two snippets below and work together?

      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },

      -- This is for the config where the codeium virtual text is off
      -- default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium', 'lazydev' },
      -- providers = {
      --   lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      --   codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
      -- },
    },

    snippets = { preset = 'luasnip' },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  },
}
