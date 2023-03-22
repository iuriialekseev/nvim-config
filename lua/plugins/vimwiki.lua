return {
  'vimwiki/vimwiki',
  lazy = false,
  keys = {
    -- align tables
    { '<leader>tl', '<cmd>:s/\\v[^|]+/---/g<cr>i<esc><cmd>:noh<cr>' },
    { '<leader>tr', '<cmd>:s/\\v[^|]+/---:/g<cr>i<esc><cmd>:noh<cr>' },
    { '<leader>tm', '<cmd>:s/\\v[^|]+/:---:/g<cr>i<esc><cmd>:noh<cr>' },
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
