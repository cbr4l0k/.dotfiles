local vim = vim
local map = vim.keymap.set
-- Leader setup
vim.g.mapleader = ' '

-- Keybindings 
vim.keymap.set('n', '<space>.', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<space>s', '<cmd>so<cr>', {desc = 'Relod current file'})

vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d',  { noremap = true })
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
-- vim.keymap.set({'n', 'x'}, '<leader>pv', vim.cmd.Ex)

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

vim.keymap.set('n', "<leader>tt", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 bash <CR> ")
vim.keymap.set('n', "tt", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")


vim.api.nvim_create_augroup('PythonSettings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'PythonSettings',
    pattern = 'python',
    callback = function()
        vim.keymap.set('n', '<leader>b', ':!black %<CR>', { buffer = true })
    end,
})


-- Debuger
-- vim.cmd([[
-- nmap <F9> <cmd>call vimspector#Launch()<cr>
-- nmap <F5> <cmd>call vimspector#StepOver()<cr>
-- nmap <F8> <cmd>call vimspector#Reset()<cr>
-- nmap <F11> <cmd>call vimspector#StepOver()<cr>")
-- nmap <F12> <cmd>call vimspector#StepOut()<cr>")
-- nmap <F10> <cmd>call vimspector#StepInto()<cr>")
-- ]])
-- vim.keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")
