"
" NORMAL MODE MAPPING
"

" Edit vimrc
nnoremap <leader>vrc :vsplit ~/.vimrc<cr>

" Reload vimrc
nnoremap <leader>rl :source ~/.vimrc<cr>

" Better command mode
nnoremap ; :

" Fast quit window
nnoremap <leader>q :q<cr>

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

" Wrap word with ', ", `
nnoremap <leader>' bi'<esc>ea'<esc>
nnoremap <leader>" bi"<esc>ea"<esc>
nnoremap <leader>` bi`<esc>ea`<esc>

" Fast exit
nnoremap <leader>q :wqa<cr>

"
" INSERT MODE MAPPING
"

" Disable esc key
inoremap <esc> <nop>

" Exit insert mode
inoremap <a-i> <esc>

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

inoremap <a-q> <esc>:wqa<cr>
inoremap <a-u> <esc>gUawea

" Expand snippet
imap <silent><expr> <a-a> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''

