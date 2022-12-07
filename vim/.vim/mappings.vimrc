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
nnoremap <leader>z za

" Toggle all fold
nnoremap <leader>x :set foldenable!

" LSP
nnoremap <leader>a <Plug>(coc-codeaction-cursor)
nnoremap <leader>d <Plug>(coc-definition)
nnoremap <leader>n <Plug>(coc-rename)
nnoremap <leader>r <Plug>(coc-references)
nnoremap <leader>e <Plug>(coc-diagnostic-next)
nnoremap <leader>E <Plug>(coc-diagnostic-prev)
nnoremap <leader>p <Plug>(coc-format-selected)

" Toggle file explorer
nnoremap <leader><leader> :NvimTreeFindFileToggle<CR>

" Find file with same basename: Hello.tsx - Hello.css
nnoremap <leader><tab> :lua require("mdossan").findSameBaseName()<CR>

" Find file in repo with FZF
nnoremap <leader>f :lua require("mdossan").findFile()<cr>
nnoremap <leader>t :lua require("mdossan").testCurrentFile()<CR>

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

" Alt key mapping in insert mode
inoremap <a-a> <right>
inoremap <a-backspace> <del>
inoremap <a-i> <esc>
inoremap <a-q> <esc>:wqa<cr>
inoremap <a-s> <cmd>lua require('luasnip').expand_or_jump()<Cr>
inoremap <a-u> <esc>u
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <esc> <nop>

" Expand snippet
imap <silent><expr> <a-f> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '' 

