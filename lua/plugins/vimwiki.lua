return {
  'vimwiki/vimwiki',
  ft = 'markdown',
  keys = {
    -- align tables
    { '<leader>tl', ':s/\\v[^|]+/---/g<cr>i<esc><cmd>:noh<cr>' },
    { '<leader>tr', ':s/\\v[^|]+/---:/g<cr>i<esc><cmd>:noh<cr>' },
    { '<leader>tm', ':s/\\v[^|]+/:---:/g<cr>i<esc><cmd>:noh<cr>' },
  },
  config = function()
    vim.g.vimwiki_list = {
      {
        syntax = 'markdown',
        ext = '.md',
      }
    }
  end,
}
