local vim = vim
local map = vim.keymap.set

-- Keybindings 
vim.keymap.set('n', '<space>.', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<space>s', '<cmd>so<cr>', {desc = 'Relod current file'})

vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d',  { noremap = true })
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
-- vim.keymap.set({'n', 'x'}, '<leader>pv', vim.cmd.Ex)

-- Spell checking
vim.keymap.set('n', '<leader>sp', function()
    vim.opt.spell = not vim.opt.spell:get()
    print("Spell check: " .. (vim.opt.spell:get() and "ON" or "OFF"))
end, {desc = 'Toggle spell check'})
vim.keymap.set('n', '<leader>sn', ']s', {desc = 'Next spelling error'})
vim.keymap.set('n', '<leader>sN', '[s', {desc = 'Previous spelling error'})
vim.keymap.set('n', '<leader>sa', 'zg', {desc = 'Add word to dictionary'})
vim.keymap.set('n', '<leader>s?', 'z=', {desc = 'Suggest corrections'})

-- Toggle inlay hints
vim.keymap.set('n', '<leader>ih', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    print("Inlay hints: " .. (vim.lsp.inlay_hint.is_enabled() and "ON" or "OFF"))
end, {desc = 'Toggle inlay hints'})

vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader><leader>h', '<C-w>s')
vim.keymap.set('n', '<leader><leader>v', '<C-w>v')
vim.keymap.set('n', '<leader><leader>q', '<C-w>q')

local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    desc = 'Highlight on yank',
    callback = function(event)
        vim.highlight.on_yank({higroup = 'Visual', timeout = 2000})
    end
})

vim.keymap.set('n', "<leader><leader>t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<C-Del>", "<C-\\><C-n>:q<CR>")


vim.api.nvim_create_augroup('PythonSettings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'PythonSettings',
    pattern = 'python',
    callback = function()
        vim.keymap.set('n', '<leader>b', ':!black %<CR>', { buffer = true })
    end,
})
