return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  keys = {
    { '<leader>f', ':Telescope find_files<cr>' },
    { '<leader>l', ':Telescope live_grep<cr>' },
    { '<leader>L', ':Telescope grep_string<cr>' },
    { '<leader>?', ':Telescope help_tags<cr>' },
  },
  config = function()
    local o = vim.o
    local telescope = require('telescope')

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
