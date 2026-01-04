local root_markers = require('_shared').root_markers

---@type vim.lsp.Config
return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss' },
  root_markers = { root_markers.node, root_markers.git },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  settings = {
    css = { validate = true },
    scss = { validate = true },
  },
}
