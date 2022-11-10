return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- LSP Utils
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    --  Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Fuzzy finder
    use 'vijaymarupudi/nvim-fzf'

    -- TS
    use 'nvim-treesitter/nvim-treesitter'

    -- Git
    use 'airblade/vim-gitgutter'

    -- Theme
    use 'dracula/vim'
    use 'vim-airline/vim-airline'
end)
