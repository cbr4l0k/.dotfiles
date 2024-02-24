local ls = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local c  = ls.choice_node
local f  = ls.function_node
local i  = ls.insert_node
local r  = ls.restore_node
local s  = ls.snippet
local t = ls.text_node
local rep = require("luasnip.extras").rep

ls.add_snippets('tex', {
    s("nc", fmt([[
\newchapter{{{}}}
]], { i(1, "chapter name"), })
    ),
    s("ns", fmt([[
\newsection{{{}}}
]], { i(1, "section name"), })
    ),
    s("nss", fmt([[
\newsubsection{{{}}}
]], { i(1, "subsection name"), })
    ),
    s('np', { t("\\newpage") }),
    s("ii", fmt([[
\item {}
]], {
        i(1, "value"),
    })),
    s("tss", fmt([[
\multicolumn{{{}}}{{|{}|}}{{\cellcolor{{ {} }} \textbf{{ {} }}}}
]], {
        i(1, "numcols"),
        c(2,{
            t("c"),
            t("l"),
            t("r"),
        }),
        i(3,'heading2-grey'),
        i(4, 'text')
    })),
})


ls.add_snippets("tex", {
	s("beg", fmt([[
\begin{{{}}}
    {}
\end{{{}}}
]], {
    i(1, "center"),
    i(2),
    rep(1),
})
	),
	s("it", fmt([[
\begin{{itemize}}
    \item {}
\end{{itemize}}
]], {
    i(1, "value"),
})
	),
})
