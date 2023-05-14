return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'preservim/nerdtree'

    -- Fuzzy finder
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use { 'junegunn/fzf.vim' }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Java
    use 'mfussenegger/nvim-jdtls'

    -- Theme
    use 'dracula/vim'
    use 'vim-airline/vim-airline'

    -- Syntax
    use 'uiiaoo/java-syntax.vim'
end)
