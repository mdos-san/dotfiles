-- https://github.com/neovim/nvim-lspconfig/tree/master
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require('lspconfig')
lspconfig.bashls.setup{}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.tsserver.setup{}

local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, opts)

vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)

vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
