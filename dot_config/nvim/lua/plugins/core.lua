return {
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
    { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
    {
        "davidmh/mdx.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "m4xshen/autoclose.nvim" },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false,
    },
    { "nvim-lua/plenary.nvim" },
    { 'mfussenegger/nvim-dap' },
    { 'voldikss/vim-floaterm' },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { 'elkowar/yuck.vim' },
    {
        'chomosuke/typst-preview.nvim',
        lazy = false,
        version = '1.*',
        opts = {},
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
}
