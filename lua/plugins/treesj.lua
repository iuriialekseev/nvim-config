return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>,', '<cmd>:TSJJoin<cr>' },
    { '<leader>.', '<cmd>:TSJSplit<cr>' },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
