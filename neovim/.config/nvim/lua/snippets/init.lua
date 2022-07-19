local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("rea", fmt(
[[import React from "react";

interface {}Props {{
}}

const {} = ({{}}: {}Props): JSX.Element => {{
    return <{}>
    {}
    </{}>
}}

export default {};
]]
    , { rep(1), i(1, "Component"), rep(1), i(2), i(0), rep(2), rep(1) })),

    s("ser", fmt(
[[interface {}ServiceFactory {{
    (): {}ServiceInterface;
}}

export interface {}ServiceInterface {{
}}

const {}Service: {}ServiceFactory = (): {}ServiceInterface  => {{

    const init = () => {{
        {}
    }}

    return {{
        init,
    }}
}}

export default {}Service;
]]
    , { rep(1), rep(1), rep(1), i(1, "Name"), rep(1), rep(1), i(0), rep(1) })),

    s("afu", fmt(
[[const {} = ({}): {} => {{
    {} 
}}
]]
    , {i(1), i(2), i(3), i(0)})),

    s("<<<", fmt([[<{} {}>{}</{}>]] , {i(1), i(2), i(0), rep(1)}))
})

