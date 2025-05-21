local mason = require 'mason-registry'
local angularls_path = mason.get_package('angular-language-server'):get_install_path()

return {
  root_dir = function(fname)
    local util = require 'lspconfig.util'

    local root_files = {
      'angular.json',
      'project.json',
      'tsconfig.app.json',
      'tsconfig.lib.json',
      'tsconfig.spec.json',
      'tsconfig.editor.json',
    }

    return util.root_pattern(unpack(root_files))(fname) or vim.fs.dirname(vim.fs.find('./node_modules', { path = fname, upward = true })[1])
  end,

  settings = {
    angular = {
      suggest = {
        includeCompletionsWithSnippetText = true,
        includeAutomaticOptionalChainCompletions = true,
      },
      trace = { server = 'verbose' },
    },
  },

  on_new_config = function(new_config, new_root_dir)
    local locations = table.concat({
      angularls_path .. './node_modules',
      new_root_dir,
    }, ',')

    new_config.cmd = {
      'ngserver',
      '--stdio',
      '--tsProbeLocations',
      locations,
      '--ngProbeLocations',
      locations,
    }
  end,
}
