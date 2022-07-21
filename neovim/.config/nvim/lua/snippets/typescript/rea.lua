local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local i = ls.insert_node

local shortcut = "rea";
local template = [[import React from "react";

interface {}Props {{
}}

const {} = ({{}}: {}Props): JSX.Element => {{
  return <{}>
    {}
  </{}>
}}

export default {};
]]

return s(shortcut, fmt(template,  { rep(1), i(1, "Component"), rep(1), i(2), i(0), rep(2), rep(1) }))

