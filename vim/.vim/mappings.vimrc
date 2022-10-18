"
" NORMAL MODE MAPPING
"

" Edit vimrc
nnoremap <leader>vrc :vsplit ~/.vimrc<cr>

" Reload vimrc
nnoremap <leader>rl :source ~/.vimrc<cr>

" Better command mode
nnoremap ; :

" Prettier
nnoremap <leader>p :%!prettier %<cr>

" Toggle current fold
nnoremap <leader>z za

" Toggle all fold
nnoremap <leader>x :set foldenable!

" LSP
nnoremap <leader>D :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>a :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>l :lua vim.lsp.buf_attach_client(0, 1)<CR>
nnoremap <leader>n :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>r :lua vim.lsp.buf.references()<CR>

" Diagnostic
nnoremap <leader>e :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>E :lua vim.diagnostic.goto_prev()<CR>

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

