vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- standard utils lib for neovim plugins
  'https://github.com/saghen/blink.cmp', -- code completion
  'https://github.com/stevearc/conform.nvim', -- formatting
  'https://github.com/lewis6991/gitsigns.nvim', -- basic git support
  'https://github.com/lukas-reineke/indent-blankline.nvim', -- indentation formatting
  'https://github.com/folke/lazydev.nvim', -- better Lua support
  'https://github.com/mason-org/mason.nvim', -- LSP manager
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/echasnovski/mini.statusline',
  'https://github.com/nvim-tree/nvim-tree.lua', -- just in cas we still want a tree view
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-treesitter/nvim-treesitter', -- syntax highlighting
  'https://github.com/stevearc/oil.nvim', -- file manager
  'https://github.com/refractalize/oil-git-status.nvim',
  'https://github.com/nvim-telescope/telescope.nvim', -- finder
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
}

require('blink.cmp').setup(require 'plugins/blink')
require('conform').setup(require 'plugins/conform')
require('gitsigns').setup(require 'plugins/gitsigns')
require('ibl').setup(require 'plugins/indent-blankline')
require('lazydev').setup()
require('mason').setup()
require('mini.icons').setup()
require('mini.statusline').setup { use_icons = true }
require('nvim-tree').setup(require 'plugins/nvim-tree')
require('nvim-treesitter').setup(require 'plugins/treesitter')
require('oil').setup(require 'plugins/oil')
require('oil-git-status').setup { config = true }
require('telescope').setup(require 'plugins/telescope')
