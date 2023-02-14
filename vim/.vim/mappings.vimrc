"
" NORMAL MODE MAPPING
"

" Edit vimrc
nnoremap <leader>vrc :vsplit ~/.vimrc<cr>

" Reload vimrc
nnoremap <leader>rl :source ~/.vimrc<cr>

" Better command mode
nnoremap ; :

" Toggle current fold
nnoremap n nzz

" Toggle current fold
nnoremap <leader>z za

" Jump
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" Toggle all fold
nnoremap <leader>x :set foldenable!

" Toggle file explorer
nnoremap <leader><leader> :NvimTreeFindFileToggle<CR>

" Find file in repo with FZF
nnoremap <leader><tab> :FZF<cr>

"
" INSERT MODE MAPPING
"

" Autopair
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap ` ``<left>
inoremap { {}<left>

" Alt key mapping move
inoremap <a-f> <right>
inoremap <a-s> <left>
inoremap <a-e> <up>
inoremap <a-d> <down>

" Alt key mapping in insert mode
inoremap <a-i> <esc>
inoremap <a-q> <esc>:wqa<cr>
inoremap <a-u> <esc>u
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <esc> <nop>

" Expand snippet
imap <silent><expr> <a-a> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''

