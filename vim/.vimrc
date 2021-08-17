" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Completion using LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Custom
Plug 'vim-airline/vim-airline'

call plug#end()

" Configure Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

colorscheme gruvbox

set number
set numberwidth=4
set nowrap
set matchtime=3
set shiftround
set shiftwidth=2

let g:netrw_liststyle = 3 " Change directory view to tree

let mapleader = ","

noremap - ddp
noremap _ ddkP

" Edit vimrc
nnoremap <leader>vrc :vsplit $MYVIMRC<cr>

" Reload vimrc
nnoremap <leader>rl :source $MYVIMRC<cr>

" Escape
inoremap <leader>jk <esc>
inoremap <esc> <nop>

" Quotes
inoremap <leader>" ""<left>
vnoremap <leader>" c"<C-R>""<ESC>
inoremap <leader>' ''<left>
vnoremap <leader>' c'<C-R>"'<ESC>
inoremap <leader>` ``<left>
vnoremap <leader>` c`<C-R>"`<ESC>

" Uppercase
inoremap <leader>u <ESC>viw<S-U>ea
vnoremap <leader>u <S-U>

" Prettier
nnoremap <leader>p :%!prettier %<cr>

" FZF
nnoremap <leader>f :FZF<cr>
nnoremap <leader>w :FZF -q <cword><cr>
nnoremap <leader>d :GFiles<cr>

" LSP
nnoremap <leader>a :LspCodeAction<cr>

