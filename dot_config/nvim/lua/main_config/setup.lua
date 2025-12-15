local vim = vim
local opt = vim.opt

opt.guicursor = ""


opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = true
opt.breakindent = true
opt.linebreak = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.mouse = 'a'

opt.scrolloff = 999
vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })

-- Auto-wrap text at 80 characters for prose/text filetypes
vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'markdown', 'typst', 'text', 'tex', 'plaintex', 'latex', 'rst', 'asciidoc', 'org' },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append('t')  -- Auto-wrap text using textwidth
  end,
})

-- Enable inlay hints for Rust
vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*.rs',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Spell checking
opt.spelllang = "en,es"
opt.spell = false  -- Disabled by default, toggle with <leader>sp
opt.spelloptions = "camel"  -- Better handling of camelCase words

-- Clear spell highlights when spell is disabled
-- Initially clear them since spell starts disabled
vim.api.nvim_set_hl(0, 'SpellBad', {})
vim.api.nvim_set_hl(0, 'SpellCap', {})
vim.api.nvim_set_hl(0, 'SpellRare', {})
vim.api.nvim_set_hl(0, 'SpellLocal', {})

vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "spell",
    callback = function()
        if not vim.opt.spell:get() then
            -- Clear spell highlighting when spell is disabled
            vim.api.nvim_set_hl(0, 'SpellBad', {})
            vim.api.nvim_set_hl(0, 'SpellCap', {})
            vim.api.nvim_set_hl(0, 'SpellRare', {})
            vim.api.nvim_set_hl(0, 'SpellLocal', {})
        else
            -- Restore spell highlights when enabled
            vim.cmd('highlight! link SpellBad GruvboxRed')
            vim.cmd('highlight! link SpellCap GruvboxBlue')
            vim.cmd('highlight! link SpellRare GruvboxPurple')
            vim.cmd('highlight! link SpellLocal GruvboxAqua')
        end
    end,
})

-- Vimspector options
-- vim.cmd([[
-- let g:vimspector_sidebar_width = 85
-- let g:vimspector_bottombar_height = 15
-- let g:vimspector_terminal_maxwidth = 70
-- ]])
