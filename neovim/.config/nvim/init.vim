source ~/.vimrc

set completeopt=menu,menuone,noselect

if has('nvim')
  lua require('setups.plugins')
  lua require('setups.nvim-cmp')
  lua require('setups.nvim-tree')
end
