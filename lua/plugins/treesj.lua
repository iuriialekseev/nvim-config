return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>j', ':TSJJoin<cr>' },
    { '<leader>k', ':TSJSplit<cr>' },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
