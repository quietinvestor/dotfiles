-- settings.lua

-- required by nvim-tree plugin

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- end of nvim-tree plugin requirements

-- meta-accessors
local o = vim.o

-- global options
o.cursorline = true -- Highlight selected line
o.tabstop = 4 -- Use 4 spaces when tab is pressed
o.shiftwidth = 4 -- Use 4 spaces for indentation
o.expandtab = true -- Spaces are used in indents
o.number = true -- Add line numbers
