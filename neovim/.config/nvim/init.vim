source ~/.vimrc

set completeopt=menu,menuone,noselect

if has('nvim')
  lua require('plugins')
   
  " Setups
  lua require('setups.nvim-tree')
  lua require('setups.nvim-treesitter')
  lua require('snippets')
end
