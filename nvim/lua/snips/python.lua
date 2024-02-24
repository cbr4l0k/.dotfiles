local ls = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local c  = ls.choice_node
local f  = ls.function_node
local i  = ls.insert_node
local r  = ls.restore_node
local s  = ls.snippet
local t = ls.text_node

local fun = [[def {}({}) -> {}:
    {}{}
]]

ls.add_snippets('python', {
    s('f',
    c(1, {
        fmt(fun, {
            r(1, 'fun_name'),
            r(2, 'fun_params'),
            i(3),
            i(4),
            r(5, 'fun_proc'),
        }),
        fmt("{} = lambda {}: {}", {
            r(1, 'fun_name'),
            r(2, 'fun_params'),
            r(3, 'fun_proc'),
        })
    })
    )
})
