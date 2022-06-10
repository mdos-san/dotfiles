source ~/.vimrc

set completeopt=menu,menuone,noselect

if has('nvim')
  lua require('plugins')
   
  " LSP
  lua require('lsp')

  " Setups
  lua require('setups.nvim-tree')
  lua require('setups.nvim-treesitter')
  lua require('setups.nvim-cmp')
end
