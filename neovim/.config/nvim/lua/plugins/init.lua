return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

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

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)
