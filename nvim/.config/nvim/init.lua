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
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			vim.lsp.enable('ts_ls')
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		opts = {},
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require'luasnip'.filetype_extend("typescript", {"javascript"})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		keys = {
			{ "<C-L>", function() require("luasnip").expand_or_jump() end, mode = "i" },
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<cr>')
		end,
	},
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Mapping
vim.keymap.set('i', '<esc>', '')
vim.keymap.set('i', 'jfj', '<esc>')
