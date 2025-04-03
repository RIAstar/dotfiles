-- `\` to open the tree and focus on the file that is curently open
vim.keymap.set('n', '\\', ':NvimTreeFindFile<cr>', { silent = true })

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    require('nvim-tree').setup {}
  end,
}
