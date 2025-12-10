return 	{
    'ggandor/leap.nvim',
    config = function()
        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
        vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
        vim.keymap.set({'x', 'o'}, 'R',  function ()
            require('leap.treesitter').select {
                -- To increase/decrease the selection in a clever-f-like manner,
                -- with the trigger key itself (vRRRRrr...). The default keys
                -- (<enter>/<backspace>) also work, so feel free to skip this.
                opts = require('leap.user').with_traversal_keys('R', 'r')
            }
        end)
        vim.keymap.set({'n', 'x', 'o'}, 'gs', function ()
            require('leap.remote').action()
        end)
    end
}
