return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>s', '<cmd>:0G<cr>' },
    { '<leader>B', '<cmd>:Git blame<cr>' },
    { '<leader>h', '<cmd>:0Gclog<cr>' },
    { '<leader>d', '<cmd>:Gdiffsplit!<cr>' },
    { '<leader>D', '<cmd>:Gdiffsplit<cr>' },
  }
}
