vim.bo.formatoptions = 'tcrqnj'

local old_formatexpr = vim.bo.formatexpr

-- Let `gq` do its formatting thing when invoked, otherwise use the LSP formatter
vim.keymap.set('n', '<leader>q', function()
  vim.bo.formatexpr = nil
  vim.cmd 'normal! gqj'
  vim.bo.formatexpr = old_formatexpr
end, { buffer = true, desc = 'LSP-safe hard-wrap' })
