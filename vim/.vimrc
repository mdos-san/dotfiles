" Prevent duplication when vimrc file is resourced
autocmd!

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

source ~/.vim/variables.vimrc
source ~/.vim/options.vimrc
source ~/.vim/mappings.vimrc
