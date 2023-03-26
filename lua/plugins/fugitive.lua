return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>s', ':0Git<cr>' },
    { '<leader>b', ':Git blame<cr>' },
    { '<leader>gc', ':Gclog -i --grep ' },
    { '<leader>gfc', ':Gclog -i --grep  -- %<left><left><left><left><left>' },
    { '<leader>gs', ':Gclog -S ' },
    { '<leader>gfs', ':Gclog -S  -- %<left><left><left><left><left>' },
  }
}
