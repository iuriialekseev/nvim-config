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
