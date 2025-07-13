-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		{ "saghen/blink.cmp", opts = {}, version = "1.4.1" },
		{ "folke/trouble.nvim", opts = {} },
		{
			"folke/snacks.nvim",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				bigfile = { enabled = true },
				dashboard = { enabled = true },
				explorer = { enabled = true },
				indent = { enabled = true },
				input = { enabled = true },
				picker = { enabled = true },
				notifier = { enabled = true },
				quickfile = { enabled = true },
				scope = { enabled = true },
				scroll = { enabled = true },
				statuscolumn = { enabled = true },
				words = { enabled = true },
			},
		},
		{
			"stevearc/conform.nvim",
			opts = {},
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						typescript = { "prettier" },
						javascript = { "prettier" },
						css = { "prettier" },
						html = { "prettier" },
						lua = { "stylua" },
					},
				})
			end,
		},
		{
			"neovim/nvim-lspconfig",
			opts = {},
			config = function()
				vim.lsp.enable("ts_ls")
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			opts = {},
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip").filetype_extend("typescript", { "javascript" })
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
			keys = {
				{
					"<C-L>",
					function()
						require("luasnip").expand_or_jump()
					end,
					mode = "i",
				},
			},
		},
		{
			"nvim-tree/nvim-tree.lua",
			opts = {},
			config = function()
				require("nvim-tree").setup()
				vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<cr>")
			end,
		},
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})

-- Mapping
vim.keymap.set("i", "<esc>", "")
vim.keymap.set("i", "<A-i>", "<esc>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>l", ":Lazy<cr>")
vim.keymap.set("n", "<leader>m", ":Mason<cr>")
vim.keymap.set("n", "<leader>f", function()
	require("conform").format()
end)

vim.diagnostic.config({ underline = true, virtual_text = true, signs = false, severity_sort = true })
