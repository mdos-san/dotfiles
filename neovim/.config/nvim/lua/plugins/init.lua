return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- COC
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Fuzzy finder
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use { 'junegunn/fzf.vim' }

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Status bar
    use 'freddiehaddad/feline.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)
