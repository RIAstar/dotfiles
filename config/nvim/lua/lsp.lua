vim.lsp.enable {
  'angularls',
  'bashls',
  'cssls',
  'css_variables',
  'html',
  'lua_ls',
  'ts_ls',
  'yamlls',
}

-- default neovim lsp bindings
-- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- "gri" is mapped to vim.lsp.buf.implementation()
-- "grn" is mapped to vim.lsp.buf.rename()
-- "grr" is mapped to vim.lsp.buf.references()
-- "grt" is mapped to vim.lsp.buf.type_definition()
-- "gO" is mapped to vim.lsp.buf.document_symbol()

local telescope = require 'telescope.builtin'
local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
end

-- simply remap to telescope instead of default quicklist
map('grr', telescope.lsp_references, '[G]oto [R]eferences')
map('gri', telescope.lsp_implementations, '[G]oto [I]mplementation')
map('grt', telescope.lsp_type_definitions, '[G]oto [T]ype Definition')
map('gO', telescope.lsp_document_symbols, '[O]pen document symbols')

-- additional
map('grd', telescope.lsp_definitions, '[G]oto [D]efinition')
map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
map('gW', telescope.lsp_dynamic_workspace_symbols, 'Open [W]orkspace Symbols')

-- highlight references under cursor
local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = highlight_augroup,
  callback = vim.lsp.buf.document_highlight,
})

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  group = highlight_augroup,
  callback = vim.lsp.buf.clear_references,
})

-- toggle inlay hints
map('<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, '[T]oggle Inlay [H]ints')

-- LSP info
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.notify('LSP attached to buffer:' .. args.buf)
    local clients = vim.lsp.get_clients { bufnr = args.buf }
    for _, client in ipairs(clients) do
      vim.notify('  Client:' .. client.name)
    end
  end,
})
