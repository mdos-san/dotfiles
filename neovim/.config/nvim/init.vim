source ~/.vimrc

set completeopt=menu,menuone,noselect

if has('nvim')
  lua require('plugins')
   
  " Setups
  lua require('setups.nvim-lsp-installer')
  lua require('setups.lspconfig')
  lua require('setups.nvim-tree')
  lua require('setups.nvim-treesitter')
  lua require('setups.nvim-cmp')
end
