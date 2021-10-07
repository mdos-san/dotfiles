" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Goto next error/warning
nmap <leader>e <Plug>(coc-diagnostic-next)

" Jump to definition
nnoremap <silent> <leader>d <Plug>(coc-definition)

" Jump to definition
nnoremap <leader>r :LspRename<cr>

" Action
nnoremap <leader>a <Plug>(coc-codeaction)

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader><leader>  <Plug>(coc-format-selected)
nmap <leader><leader>  <Plug>(coc-format-selected)

" FZF
nnoremap <leader>f :FZF<cr>


function TestFile()
  let currentFile = @%
  let ext = substitute(currentFile, '\(.*\)\.\(.*\)', '\2', 'g')

  if ext ==# "java"
    " Change main dir to 'test' and append 'Test' at end of filename
    let file = substitute(currentFile, '\(.*\)main\(.*\)\.java', '\1test\2Test.java', 'g')
  elseif ext ==# "ts"
    " Change src dir to 'test' and append 'Test' at end of filename
    let file = substitute(currentFile, '\(.*\)src\(.*\)\.\(.*\)', '\1test\2.test.\3', 'g')
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
