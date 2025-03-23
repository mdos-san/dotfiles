-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
require('mini.basics').setup()
require('mini.icons').setup()
require('mini.completion').setup()
require('mini.clue').setup()
require('mini.fuzzy').setup()
require('mini.snippets').setup()
require('mini.pairs').setup()
require('mini.bracketed').setup()

local add = MiniDeps.add

-- Colorscheme
add({ source = 'folke/tokyonight.nvim' })
vim.cmd('colorscheme tokyonight-night')

-- LSP
add({ source = 'neovim/nvim-lspconfig' })
require('lspconfig').ts_ls.setup({})

-- Mason
add({ source = 'williamboman/mason.nvim' })
require("mason").setup()

-- Nvim Tree icons (Need to be setup before nvim-tree)
add({ source = 'nvim-tree/nvim-web-devicons' })
require("nvim-web-devicons").setup()

-- Nvim Tree
add({ source = 'nvim-tree/nvim-tree.lua' })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()

-- Leader
vim.g.mapleader = " "

-- Mappings
vim.keymap.set('n', '<leader>a', ':lua vim.lsp.buf.code_action()<enter>')
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<enter>')
vim.keymap.set('n', '<leader>r', ':lua vim.lsp.buf.rename()<enter>')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<enter>')

-- Options
vim.o.mouse = ""
vim.o.mouse = ""
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
