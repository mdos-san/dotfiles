local ls = require("luasnip")

ls.add_snippets("all", {
    require("./snippets/typescript/ser")
})

-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

