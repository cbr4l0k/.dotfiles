print("working luasnips")
local cmp = require('cmp')

local ls = require('luasnip')
ls.config.setup({
    updateevents = 'TextChanged,TextChangedI'
})

local M = {}

function M.expand_or_jump()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
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

cmp.setup({
    source = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Esc>'] = cmp.mapping.abort(),
    })
})
