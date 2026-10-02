-- Needs Neovim 0.12 or later (vim.pack, vim.lsp.enable).
-- External tools: git, ripgrep, a C compiler and the tree-sitter CLI. fd is optional.

local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.relativenumber = true
opt.number = true
opt.undofile = true
opt.spell = true
opt.title = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmode = { 'longest:full', 'full' }
opt.wrap = true
opt.linebreak = true
opt.list = true
opt.listchars = { tab = '› ', trail = '•' }
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.confirm = true
opt.exrc = true
opt.textwidth = 100
opt.colorcolumn = '100'
opt.cursorline = true
opt.signcolumn = 'yes'

-- The leader must be set before any plugin defines a mapping.
vim.g.mapleader = ';'

vim.keymap.set('n', '<leader>k', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
-- Unlike the default gf, this opens the file under the cursor even if it does not exist yet.
vim.keymap.set('n', 'gf', '<cmd>edit <cfile><CR>', { desc = 'Edit file under cursor' })

require('config.plugins')
require('config.lsp')
