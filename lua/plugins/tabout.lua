-- press tab to exit brackets/quotes
return {
  'abecodes/tabout.nvim',
  dependencies = {
    'nvim-treesitter',
    'nvim-cmp',
  },
  config = function()
    require('tabout').setup({})
  end
}
