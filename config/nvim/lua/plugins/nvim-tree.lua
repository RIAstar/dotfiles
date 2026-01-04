-- `\` to open the tree and focus on the file that is curently open
vim.keymap.set('n', '\\', ':NvimTreeFindFile<cr>', { silent = true })

---@module "nvimtree"
---@type nvimtree.config
return {}
