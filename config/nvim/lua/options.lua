local opt = vim.opt

opt.termguicolors = true -- Enable true colors

-- text width
opt.textwidth = 120
opt.colorcolumn = '120' -- Highlight column 120
opt.wrapmargin = 0
opt.linebreak = true
opt.breakindent = true
opt.formatoptions = 'tcrqnj'

-- line numbers
opt.number = true
opt.relativenumber = true

-- default indentation rules
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces for a tab
opt.softtabstop = 2 -- Number of spaces for a tab when editing
opt.shiftwidth = 2 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.breakindent = true -- wrapped lines are also indented

opt.mouse = 'a'
opt.showmode = false -- don't show the current mode; we have the cursor for that

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- Directory for undo files
opt.undofile = true -- Enable persistent undo

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true -- we have a key binding on <esc> to remove the highlights

opt.signcolumn = 'yes'

opt.swapfile = false -- Disable swap files
opt.timeoutlen = 500 -- time allowed for key combos

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'
-- opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer

-- change cursor in insert and replace modes
opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
-- flash cursor to find it
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
opt.confirm = true

-- completion
opt.completeopt = { 'menuone', 'popup', 'noinsert' } -- Options for completion menu
