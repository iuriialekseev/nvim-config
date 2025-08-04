return {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
    },
    keys = {
      { '<leader>s',  ':0Git<cr>' },
      { '<leader>b',  ':Git blame<cr>' },
      { '<leader>gx', ":GBrowse<cr>" },
      { '<leader>gl', ":'<,'>Gclog --follow<cr>" },
      { '<leader>gg', ':0Gclog --follow -i --grep ""<left>' },
      { '<leader>gs', ':0Gclog --follow -S ""<left>' },
      { '<leader>gc', ':0Gclog --follow<cr>' },
      { '<leader>gG', ':Gclog -i --grep ""<left>' },
      { '<leader>gS', ':Gclog -S ""<left>' },
      { '<leader>gC', ':Gclog -100<cr>' },
    }
  }
