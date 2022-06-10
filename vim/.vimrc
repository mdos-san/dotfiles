" Prevent duplication when vimrc file is resourced
autocmd!

" Theme
let g:dracula_colorterm = 0
colorscheme dracula

let mapleader = " "

" Options
set autoread
set expandtab
set ignorecase
set matchtime=3
set nowrap
set number
set numberwidth=4
set relativenumber
set shiftround
set shiftwidth=4
set smartcase
set tabstop=4
set termguicolors

let g:netrw_liststyle = 3 " Change directory view to tree

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
nnoremap <leader>u viw<S-U>e
vnoremap <leader>u <S-U>

" Prettier
nnoremap <leader>p :%!prettier %<cr>

" COC
nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>d <Plug>(coc-definition)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>n <Plug>(coc-rename)
nmap <leader>r <Plug>(coc-references)
nmap <leader><leader> :call CocAction('format')<cr>

" Toggle file explorer
nmap <leader><space> :NvimTreeToggle<CR>

" Resize
nmap <leader>+ <c-w>>
nmap <leader>- <c-w><

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
