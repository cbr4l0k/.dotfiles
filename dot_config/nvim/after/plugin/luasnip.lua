require("luasnip.loaders.from_vscode").lazy_load()
local vim = vim

local ls = require('luasnip')
ls.config.setup({
    updateevents = 'TextChanged,TextChangedI'
})

local M = {}

local function check_luasnip()
    local ls_ok, ls_status = pcall(ls.active_snip)
    if not ls_ok then
        return false
    end

    return ls_status ~= nil
end

function M.expand_or_jump()
    if check_luasnip() then
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    else
        -- If not inside a snippet, just insert a tab
        return vim.api.nvim_put({ '\t' }, '', false, true)
    end
end

function M.jump_prev()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

function M.change_choice()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end

local mode = { 'i', 's' }

vim.keymap.set(mode, '<Tab>', M.expand_or_jump)
vim.keymap.set(mode, '<S-Tab>', M.jump_prev)
vim.keymap.set(mode, '<C-e>', M.change_choice)
