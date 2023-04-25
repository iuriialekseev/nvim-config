return {
  'nvim-tree/nvim-tree.lua',
  version = 'nightly',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>n', ':NvimTreeToggle<cr>' },
    { '<leader>N', ':NvimTreeFindFile<cr>' },
  },
  config = function()
    require('nvim-tree').setup({
      renderer = {
        root_folder_label = false,
      },
      view = {
        -- adaptive_size = true,
      },
      live_filter = {
        prefix = ' > ',
        always_show_folders = false,
      },
      git = {
        ignore = false,
      },
    })
  end
}
