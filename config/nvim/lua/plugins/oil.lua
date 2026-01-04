-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- open current file's parent dir
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

---@module "oil"
---@type oil.SetupOpts
return {
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,

    is_hidden_file = function(name, bufnr)
      -- lua pattern matching does not support logical or with `|`
      local m = name:match '^%.'
      if m == nil then
        m = name:match 'lock%.json$'
      end
      return m ~= nil
    end,

    is_always_hidden = function(name, _)
      return name == '..' or name == '.git'
    end,
  },
  win_options = {
    signcolumn = 'yes:2',
  },
}
