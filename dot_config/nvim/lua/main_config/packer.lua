-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "ellisonleao/gruvbox.nvim"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use {
        'davidmh/mdx.nvim',
        config = true,
        requires = {
            'nvim-treesitter/nvim-treesitter',
        }
    }

    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("cohama/lexima.vim")

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim

            -- LSP Support
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},

            -- Completion framework:
            {'hrsh7th/nvim-cmp'},

            -- LSP completion source:
            {'hrsh7th/cmp-nvim-lsp'},

            -- Useful completion sources:
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
            {'hrsh7th/cmp-vsnip'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/vim-vsnip'},
        }
    }

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    use 'voldikss/vim-floaterm'

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use 'nvim-tree/nvim-web-devicons'

    use 'nanotee/zoxide.vim'
    use 'elkowar/yuck.vim'
    use {
        'eraserhd/parinfer-rust',
        opt = true,
        rtp = 'target/release',
        run = 'cargo build --release'
    }
    use {
        'harrygallagher4/nvim-parinfer-rust',
        config = function()
            vim.api.nvim_create_autocmd(
            'VimEnter',
            { callback = function() require'parinfer'.setup() end}
            )
        end
    }
    use {'kaarmu/typst.vim', ft = {'typst'}}
    use {'HakonHarnes/img-clip.nvim'}
end)

