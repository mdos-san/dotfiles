require("nvim-tree").setup({
  git = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    adaptive_size = true,
  },
})
