local ls = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local c  = ls.choice_node
local f  = ls.function_node
local i  = ls.insert_node
local r  = ls.restore_node
local s  = ls.snippet
local t = ls.text_node


ls.add_snippets('lua', {
    s("snipp", {
        t("ls.add_snippets('"),
        f(function ()
                local value = vim.fn.expand('%:t')
                local path = vim.split(value, '%.')
                return path[1]
            end
        , {}),
        t("', {"),
        i(1),
        t("})"),
    })
})


--[[
-- Possible options:
--     1. local <name> = <value>
--     2. <name> = <value>
]]-- 
ls.add_snippets('lua', {
    s('var', c(1, {
        fmt('local {} = {}', {
            r(1, 'var_name'),
            r(2, "var_value"),
        }),
        fmt('{} = {}', {
            r(1, 'var_name'),
            r(2, "var_value"),
        }),
    }), {
        stored = {
            var_name = i(1, "name"),
            var_value = i(2, "'value'"),
        }
    })
})

-- require(<library>)
ls.add_snippets('lua', {
    s('req', fmt('require({})', {
        i(1),
    }))
})

ls.add_snippets('lua', {
    s('ii', fmt('local {} = require("{}")', {
        f(function (values)
            local value = values[1][1]
            local path = vim.split(value, '%.')
            return path[#path]
        end, {1}),
        i(1)
    }))
})

