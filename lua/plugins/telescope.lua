return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  keys = {
    { '<leader>f', ':Telescope find_files<cr>' },
    { '<leader>l', ':Telescope live_grep_args<cr>' },
    { '<leader>?', ':Telescope help_tags<cr>' },
  },
  config = function()
    local o = vim.o
    local telescope = require('telescope')
    local lga_actions = require('telescope-live-grep-args.actions')

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
        -- live_grep = {
        --   additional_args = function(_)
        --     return { '--hidden' }
        --   end,
        -- },
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
              ['<C-t>'] = lga_actions.quote_prompt({ postfix = ' -t ' }),
            },
          },
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('live_grep_args')
  end
}
