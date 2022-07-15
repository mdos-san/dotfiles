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
set foldmethod=indent
set nofoldenable
set cursorline

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

" FZF
nnoremap <leader>f :FZF<cr>

" Snippet
imap <silent> <a-f> <cmd>lua require('luasnip').expand_or_jump()<Cr>
imap <silent> <a-d> <cmd>lua require('luasnip').jump(-1)<Cr>

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
