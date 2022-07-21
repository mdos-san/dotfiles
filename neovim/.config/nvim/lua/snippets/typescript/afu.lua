local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.snippet
local i = ls.insert_node

local shortcut = "afu";
local template =[[const {} = ({}): {} => {{
  {} 
}}
]]

return s(shortcut, fmt(template,  {i(1), i(2), i(3), i(0)}))

