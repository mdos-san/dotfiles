-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>E', vim.diagnostic.goto_prev, opts)

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', '<leader>d', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- No need to setup rust: Done automatically by rust-tools

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['csharp_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

