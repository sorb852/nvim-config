local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
  clangd = {
    filetypes = {
      'c',
      'cpp',
      'objc',
      'objcpp',
      'jsx' --[[ just for testing if the configs here actually apply ]],
    },
  },
  pyright = {},
  ts_ls = {
    root_dir = function(fname)
      local util = require 'lspconfig.util'
      if util.root_pattern('deno.json', 'deno.jsonc', 'deno.lock')(fname) then
        print 'ERROR: poopy deno found'
        return nil
      end
      print 'NO poopy deno found'
      return util.root_pattern('tsconfig.json', 'jsconfig.json')(fname)
    end,
  },
  rust_analyzer = {},
  jsonls = {},
  glsl_analyzer = {},
  denols = {
    root_dir = function(fname)
      return require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc', 'deno.lock')(fname) or nil
    end,
  },

  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua', -- Used to format Lua code
  'prettier',
})
vim.notify(tostring(ensure_installed), vim.log.levels.INFO, {
  title = 'Mason LSP servers',
  render = 'minimal',
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      vim.notify('Setting up LSP server: ' .. server_name, vim.log.levels.INFO, {
        title = 'LSP Server Setup',
        render = 'minimal',
      })
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
      -- server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      -- require('lspconfig')[server_name].setup(server)

      require('lspconfig')[server_name].setup(vim.tbl_deep_extend('force', { capabilities = capabilities }, server))
    end,
  },
}
