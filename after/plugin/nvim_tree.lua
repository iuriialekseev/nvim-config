require('nvim-tree').setup({
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = { '<C-]>', '=' }, action = 'cd' }
      },
    },
  },
  live_filter = {
    prefix = ' > ',
    always_show_folders = false,
  },
  git = {
    ignore = false,
  },
})
