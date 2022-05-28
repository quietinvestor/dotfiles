-- keymaps.lua

-- Define key mappings for Neovim and installed plugins
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Key mappings
map('n', '<S-x>', ':NvimTreeToggle<CR>')
