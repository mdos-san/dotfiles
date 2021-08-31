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
set relativenumber

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

" Better command mode
nnoremap ; :

" Quotes
inoremap <leader>" ""<left>
vnoremap <leader>" c"<C-R>""<ESC>
inoremap <leader>' ''<left>
vnoremap <leader>' c'<C-R>"'<ESC>
inoremap <leader>` ``<left>
vnoremap <leader>` c`<C-R>"`<ESC>
vnoremap <leader>( c(<C-R>")<ESC>

" Uppercase
inoremap <leader>u <ESC>viw<S-U>ea
vnoremap <leader>u <S-U>

" Prettier
nnoremap <leader>p :%!prettier %<cr>

" Format with LSP
nnoremap <leader><leader> :LspDocumentFormat<cr>

" Goto error/warning with LSP
nnoremap <leader>e :LspNextError<cr>
nnoremap <leader>w :LspNextWarning<cr>

" Jump to definition
nnoremap <leader>d :LspDefinition<cr>

" Jump to definition
nnoremap <leader>r :LspRename<cr>

" FZF
nnoremap <leader>f :FZF<cr>

" LSP
nnoremap <leader>a :LspCodeAction<cr>

function TestFile()
  let currentFile = @%
  let ext = substitute(currentFile, '\(.*\)\.\(.*\)', '\2', 'g')

  if ext ==# "java"
    " Change main dir to 'test' and append 'Test' at end of filename
    let file = substitute(currentFile, '\(.*\)main\(.*\)\.java', '\1test\2Test.java', 'g')
  elseif ext ==# "tsx"
    " Change src dir to 'test' and append 'Test' at end of filename
    let file = substitute(currentFile, '\(.*\)src\(.*\)\.\(.*\)', '\1test\2.test.\3', 'g')
  endif

  execute 'vsplit' file
endfunction

function CreateFileDirectories()
  let currentFile = @%
  let dirs = substitute(currentFile, '\(.*\)\/\(.*\)$', '\1', 'g')
  call mkdir(dirs, 'p')
endfunction

" Switch to test file
nnoremap <leader>t :call TestFile()<cr>
