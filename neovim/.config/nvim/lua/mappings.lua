require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Leader>n", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<Leader>p", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "<Leader>a", vim.lsp.buf.code_action, { desc = "Actions" })
map("n", "<Leader>f", vim.lsp.buf.format, { desc = "Format document" })
map("n", "<Leader>d", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<Leader>r", vim.lsp.buf.references, { desc = "Find references" })
map("n", "<Leader>R", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<Leader>h", vim.lsp.buf.hover, { desc = "Hover" })

map("i", "jk", "<ESC>")
map("i", "<A-i>", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
