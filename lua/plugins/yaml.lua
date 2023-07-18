return {
  'cuducos/yaml.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'VeryLazy',
  keys = {
    { '<leader>y', ':YAMLYankKey +<cr>' },
  },
  config = function()
    require('nvim-surround').setup({})
  end
}
