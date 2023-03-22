return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    vim.opt.laststatus = 3

    require('lualine').setup({
      options = {
        theme = 'github_light_default',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'filename',
            file_status = false,
            path = 1,
          },
        },
        lualine_x = { 'diff', 'diagnostics' },
        lualine_y = { 'progress' },
        lualine_z = {}
      },
    })
  end
}
