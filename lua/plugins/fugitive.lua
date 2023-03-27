return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>s', ':0Git<cr>' },
    { '<leader>b', ':Git blame<cr>' },
    { '<leader>gg', ':Gclog -i --grep=""<left>' },
    { '<leader>gG', ':0Gclog --follow -i --grep=""<left>' },
    { '<leader>gs', ':Gclog -S""<left>' },
    { '<leader>gS', ':0Gclog --follow -S""<left>' },
    { '<leader>gc', ':Gclog -100<cr>' },
    { '<leader>gC', ':0Gclog --follow<cr>' },
  }
}
