local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local su = require("luasnip_snippets.common.snip_utils")
local nl = su.new_line

ls.add_snippets("all", {
    s({ trig = "gb", desc = "current branch" }, {
        f(
            function(args, parent, user_args)
                local _, res = pcall(vim.fn.system, "git branch --show-current")
                if vim.v.shell_error ~= 0 then
                    return ""
                else
                    return string.sub(res, 1, -2)
                end
            end
        )
    })
})

ls.add_snippets("c", {
    s({ trig = "fori", desc = "for size_t loop" }, {
        t "for (size_t i = ", i(2, "0", { key = "i1" }), t "; i < ", i(1, "", { key = "i2", }), t "; i++) {", nl(),
        t "    ", i(3, "", { key = "i3" }), nl(),
        t "}", i(0, "", { key = "i0" })
    })
})

ls.add_snippets("go", {
    s({ trig = "ir", desc = "if error not nil" }, {
        t "if err != nil {", nl(),
        t "\t", i(1, "", { key = "i1" }), nl(),
        t "}", i(0, "", { key = "i0" })
    }),
    s({ trig = "fori", desc = "for int loop" }, {
        t "for i := ", i(2, "0", { key = "i2" }), t "; i < ", i(1, "", { key = "i1" }), t "; i++", t " {", nl(),
        t "\t", i(3, "", { key = "i3" }), nl(),
        t "}", i(0, "", { key = "i0" })
    }),

    -- struct declaration
    s({ trig = "st", desc = "struct" }, {
        t "type ", i(1, "", { key = "i1" }), t " struct {", nl(),
        t "\t", i(2, "", { key = "i2" }), nl(),
        t "}", nl(), i(0, "", { key = "i0" })
    }),
    -- interface declaration
    s({ trig = "in", desc = "full interface " }, {
        t "type ", i(1, "", { key = "i1" }), t " interface {", nl(),
        t "\t", i(2, "", { key = "i2" }), nl(),
        t "}", nl(), i(0, "", { key = "i0" })
    }),

    s({ trig = "main", desc = "main file setup" }, {
        t "package main", nl(), nl(),
        t "func main() {", nl(),
        t "\t", i(1, "", { key = "i1" }), nl(),
        t "}", i(0, "", { key = "i0" })
    }),

    -- function
    s({ trig = "fn", desc = "function" }, {
        t "func ", i(1, "", { key = "i1" }), t "(", i(2, "", { key = "i2" }), t ") ", i(3, "",
        { key = "i3" }),
        t " {", nl(),
        t "\t", i(4, "", { key = "i4" }), nl(),
        t "}", nl(),
        i(0, "", { key = "i0" })
    }),
    -- method
    s({ trig = "fm", desc = "method" }, {
        t "func (", i(1, "", { key = "i1" }), t " ", i(2, "", { key = "i2" }), t ") ", i(3,
        "",
        { key = "i3" }), t "(", i(4, "", { key = "i4" }), t ") ", i(5, "error", { key = "i5" }), t " {", nl(),
        t "\t", i(6, "", { key = "i6" }), nl(),
        t "}", nl(),
        i(0, "", { key = "i0" })
    }),

    -- prints
    s({ trig = "pf", desc = "fmt.Printf()" }, {
        t "fmt.Printf(\"", i(1, "", { key = "i1" }), t "\")", i(0, "", { key = "i0" }) }),
    s({ trig = "pl", desc = "fmt.Println()" }, {
        t "fmt.Println(\"", i(1, "", { key = "i1" }), t "\")", i(0, "", { key = "i0" })
    }),
})

ls.add_snippets("latex", {
    s({ trig = "lab", desc = "Basic laboratory report preambula" }, {
        t "\\documentclass[14pt]{extarticle}", nl(),
        t "\\usepackage{indentfirst}", nl(),
        t "\\usepackage{nopageno}", nl(),
        t "\\usepackage{fontspec}", nl(),
        t "\\usepackage{polyglossia}", nl(), nl(),
        t "\\setdefaultlanguage{russian}", nl(),
        t "\\setotherlanguage{english}", nl(), nl(),
        t "\\setmainfont{Liberation Serif}", nl(),
        t "\\linespread{1.5}", nl(),
    }),
    s({ trig = "be", desc = "2" }, {
        t "\\begin{", i(1, "", { key = "item" }, t "}"), nl(),
        t "\\end{", i(1, "", { key = "item" }, t "}"), nl(),
    }),
})

ls.add_snippets("markdown", {
    s({ trig = "*", desc = "italics", priority = 800 }, {
        t "*", i(1, "", { key = "i1" }), t "*", i(0, "", { key = "i0" })
    }),
    s({ trig = "**", desc = "bold", priority = 900 }, {
        t "**", i(1, "", { key = "i1" }), t "**", i(0, "", { key = "i0" })
    }),
    s({ trig = "***", desc = "bold italics", priority = 1000 }, {
        t "***", i(1, "", { key = "i1" }), t "***", i(0, "", { key = "i0" })
    }),
    s({ trig = "-", desc = "bar" }, {
        t "---", nl()
    }),
    s({ trig = "link", desc = "link to something" }, {
        t "[", i(1, "", { key = "i1" }), t "](", i(2, "", { key = "i2" }), t ")", i(0, "", { key = "i0" })
    }),
    s({ trig = "url", desc = "link to url" }, {
        t "[", i(1, "", { key = "i1" }), t "](https://", i(2, "", { key = "i2" }), t ")", i(0, "", { key = "i0" })
    }),
    s({ trig = "img", desc = "image" }, {
        t "![", i(1, "", { key = "i1" }), t "](", i(2, "", { key = "i2" }), t ")", i(0, "", { key = "i0" })
    }),
    s({ trig = "code", desc = "codeblock" }, {
        t "```", i(1, "", { key = "i1" }), nl(),
        i(2, "", { key = "i2" }), nl(),
        t "```", i(0, "", { key = "i0" })
    }),
})
