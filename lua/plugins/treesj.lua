return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>j', '<cmd>:TSJJoin<cr>' },
    { '<leader>s', '<cmd>:TSJSplit<cr>' },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
