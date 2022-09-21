" Prevent duplication when vimrc file is resourced
autocmd!

" Theme
let g:dracula_colorterm = 0
colorscheme dracula

let $BASH_ENV = "~/.bashrc"

let mapleader = " "

" Options
set autoread
set cursorline
set expandtab
set foldmethod=indent
set ignorecase
set matchtime=3
set nofoldenable
set nowrap
set number
set numberwidth=4
set relativenumber
set scrolloff=10
set shiftround
set shiftwidth=4
set smartcase
set tabstop=4
set termguicolors
set timeoutlen=250

let g:netrw_liststyle = 3 " Change directory view to tree

noremap - ddp
noremap _ ddkP

" Edit vimrc
nnoremap <leader>vrc :vsplit ~/.vimrc<cr>

" Reload vimrc
nnoremap <leader>rl :source ~/.vimrc<cr>

" Better command mode
nnoremap ; :

" Quotes
vnoremap <leader>" c"<C-R>""<ESC>
vnoremap <leader>' c'<C-R>"'<ESC>
vnoremap <leader>` c`<C-R>"`<ESC>
vnoremap <leader>( c(<C-R>")<ESC>

" Uppercase
nnoremap <leader>u viw<S-U>e
vnoremap <leader>u <S-U>

" Prettier
nnoremap <leader>p :%!prettier %<cr>

" Diagnostic
nmap <leader>e :lua vim.diagnostic.goto_next()<CR>
nmap <leader>E :lua vim.diagnostic.goto_prev()<CR>

" Toggle current fold
nnoremap <leader>z za

" Toggle all fold
nnoremap <leader>x :set foldenable!

" LSP
nmap <leader>a :lua vim.lsp.buf.code_action()<CR>
nmap <leader>d :lua vim.lsp.buf.definition()<CR>
nmap <leader>D :lua vim.lsp.buf.declaration()<CR>
nmap <leader>n :lua vim.lsp.buf.rename()<CR>
nmap <leader>r :lua vim.lsp.buf.references()<CR>
nmap <leader><leader> :lua vim.lsp.buf.formatting()<cr>

" Wrap word with ()
nnoremap <leader>( viw"zdi()<esc>"zPl

" Toggle file explorer
nmap <leader><space> :NvimTreeToggle<CR>

" Resize
nmap <leader>+ <c-w>>
nmap <leader>- <c-w><

nnoremap <leader>f :lua require("mdossan").findFile()<cr>
nnoremap <leader>t :lua require("mdossan").testCurrentFile()<CR>
nnoremap <leader><tab> :lua require("mdossan").findSameBaseName()<CR>

inoremap <esc> <nop>
inoremap <a-a> <esc>
inoremap <a-i> <esc>
inoremap <a-u> <esc>u
inoremap <a-s> <cmd>lua require('luasnip').expand_or_jump()<Cr>
inoremap <a-backspace> <del>
inoremap ' ''<left>
inoremap " ""<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

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

"Polyconseil
autocmd FileType java lua vim.lsp.buf_attach_client(0, 1)
