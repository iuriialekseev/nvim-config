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
      local actions = require('telescope.actions')

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
          mappings = {
            i = {
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.add_to_qflist + actions.open_qflist,
              ["<M-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
            },
          },
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
