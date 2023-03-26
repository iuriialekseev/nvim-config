return {
  'cuducos/yaml.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  ft = 'yaml',
  keys = {
    { '<leader>y', ':YAMLYankKey +<cr>' },
  },
}
