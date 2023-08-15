source ~/.vimrc

set completeopt=menu,menuone,noselect

if has('nvim')
  lua require('plugins')
   
  " Setups
  lua require('setups.nvim-cmp')
  lua require('setups.rust-tools')
  lua require('setups.treesitter')
  lua require('setups.nvim-tree')
  lua require('setups.catppuccin')
  lua require('setups.feline')
  lua require('snippets')
end
