return {
  'nvim-tree/nvim-tree.lua',
  version = 'nightly',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>n', '<cmd>:NvimTreeToggle<cr>' },
    { '<leader>N', '<cmd>:NvimTreeFindFile | NvimTreeFocus<cr>' },
  },
  config = function()
    require("nvim-tree").setup({
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
  end
}
