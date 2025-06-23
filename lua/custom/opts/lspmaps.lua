--[[

This file is used for setting lsp specific keymaps

--]]

local function map(event, keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
end

local function set_mappings(event)
  -- Rename the variable under your cursor.
  map(event, 'grn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Execute a code action, usually your cursor needs to be on top of an error
  map(event, 'gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

  -- Find references for the word under your cursor.
  map(event, 'grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- Jump to the implementation of the word under your cursor.
  map(event, 'gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  -- Jump to the definition of the word under your cursor.
  -- NOTE: To jump back, press <C-t>.
  map(event, 'grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map(event, 'grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- Fuzzy find all the symbols in your current document.
  map(event, 'gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

  -- Fuzzy find all the symbols in your current workspace.
  map(event, 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

  -- Jump to the type of the word under your cursor.
  map(event, 'grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
end

return { map = map, set_mappings = set_mappings }
