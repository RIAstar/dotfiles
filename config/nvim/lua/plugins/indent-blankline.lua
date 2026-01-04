local highlight = {
  'CursorColumn',
  'Whitespace',
}

---@module "ibl"
---@type ibl.config
return {
  indent = { highlight = highlight, char = '' },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { enabled = false },
}
