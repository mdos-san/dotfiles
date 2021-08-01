" PLUGINS
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

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>` <esc>`<i`<esc>`>a`<esc>

inoremap <leader>jk <esc>
inoremap <esc> <nop>

nnoremap <leader>o 0y$:tabnew <c-r>"<cr>
nnoremap <leader>p :%!prettier %<cr>

nnoremap <leader>f :FZF<cr>
nnoremap <leader>w :FZF -q <cword><cr>
nnoremap <leader>d :GFiles<cr>

nnoremap <leader>a :LspCodeAction<cr>

