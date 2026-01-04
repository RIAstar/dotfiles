local map = vim.keymap.set
local s = { silent = true }

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', 'j', function()
  return tonumber(vim.api.nvim_get_vvar 'count') > 0 and 'j' or 'gj'
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
map('n', 'k', function()
  return tonumber(vim.api.nvim_get_vvar 'count') > 0 and 'k' or 'gk'
end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given
map('n', '<C-d>', '<C-d>zz') -- Scroll down and center the cursor
map('n', '<C-u>', '<C-u>zz') -- Scroll up and center the cursor
map('n', '<Leader>w', '<cmd>w!<CR>', s) -- Save the current file
map('n', '<Leader>q', '<cmd>q<CR>', s) -- Quit Neovim
map('n', '<Leader>-', '<cmd>vsplit<CR>', s) -- Split the window vertically
map('n', '<Leader>_', '<cmd>split<CR>', s) -- Split the window horizontally
map('v', '<Leader>p', '"_dP') -- Paste without overwriting the default register
map('t', '<Esc>', '<C-\\><C-N>') -- Exit terminal mode

-- auto-pairs
map('i', "'", "''<left>")
map('i', '`', '``<left>')
map('i', '"', '""<left>')
map('i', '(', '()<left>')
map('i', '[', '[]<left>')
map('i', '{', '{}<left>')

-- buffers
map('n', '<leader>bi', function()
  local current_file = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())

  -- wipe all open buffers
  vim.cmd '%bw'

  -- reopen the file that was open
  vim.cmd('edit! ' .. vim.fn.fnameescape(current_file))

  -- clean up the empty buffer that %bw created
  local empty_buf = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_get_name(empty_buf) == '' then
    vim.cmd('bw ' .. empty_buf)
  end

  -- put cursor back at previous position
  vim.cmd 'normal! \'"'
end, { noremap = true, desc = '[I]solate current [B]uffer (i.e. wipe all others)' })

-- windows
-- FIXME this doesn't work very well with the same key bindings in Kitty
vim.keymap.set('n', '<C-h>', '<C-w><h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><k>', { desc = 'Move focus to the upper window' })
