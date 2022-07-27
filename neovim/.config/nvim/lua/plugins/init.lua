return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- LSP Utils
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    --  Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippet
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Fuzzy finder
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- TS
    use 'nvim-treesitter/nvim-treesitter'

    -- Git
    use 'airblade/vim-gitgutter'

    -- Theme
    use 'dracula/vim'
    use 'vim-airline/vim-airline'
end)
