return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<cr>' },
    { '<leader>l', '<cmd>Telescope live_grep<cr>' },
    { '<leader>?', '<cmd>Telescope help_tags<cr>' },
    { '<leader>b', '<cmd>Telescope buffers<cr>' },
  },
  config = function()
    local telescope = require('telescope')
    local o = vim.o

    telescope.setup({
      defaults = {
        file_ignore_patterns = { '.git/' },
        layout_strategy = 'vertical',
        layout_config = {
          height = o.lines,
          width = o.columns,
          prompt_position = 'top',
          preview_height = 0.5,
        },
        sorting_strategy = 'ascending',
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
    })

    telescope.load_extension('fzf')
  end
}
