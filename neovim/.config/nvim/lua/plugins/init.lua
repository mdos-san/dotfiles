return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Fuzzy finder
    use 'vijaymarupudi/nvim-fzf'

    -- TS
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Theme
    use 'dracula/vim'
    use 'vim-airline/vim-airline'
end)
