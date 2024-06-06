-- https://github.com/neovim/nvim-lspconfig/tree/master
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
local lspconfig = require('lspconfig')
lspconfig.bashls.setup{}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.tsserver.setup{}
