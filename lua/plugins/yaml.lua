return {
    'cuducos/yaml.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'yaml', 'yml' },
    opts = {},
    config = function(_, opts)
      require('yaml_nvim').setup(opts)

      local group = vim.api.nvim_create_augroup('YamlNvimKeymaps', { clear = false })
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = { 'yaml', 'yml' },
        callback = function(ev)
          vim.keymap.set('n', '<leader>y', '<cmd>YAMLYankKey +<CR>', {
            buffer = ev.buf,
            desc = 'YAML yank key path',
          })
        end,
      })
    end,
  }
