local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local i = ls.insert_node

local shortcut = "ser";
local template = [[interface {}ServiceFactory {{
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

return s(shortcut, fmt(template,  { rep(1), rep(1), rep(1), i(1, "Name"), rep(1), rep(1), i(0), rep(1) }))

