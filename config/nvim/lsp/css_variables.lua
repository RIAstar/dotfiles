local root_markers = require('_shared').root_markers

---@type vim.lsp.Config
return {
  cmd = { 'css-variables-language-server', '--stdio' },
  filetypes = { 'css', 'scss' },
  root_markers = { root_markers.node, root_markers.git },
  settings = {
    cssVariables = {
      lookupFiles = { '**/*.scss', '**/*.sass', '**/*.css' },
      blacklistFolders = {
        '**/.cache',
        '**/dist',
        '**/node_modules',
        '**/tmp',
        '**/www',
      },
    },
  },
}
