return {
    'Kicamon/markdown-table-mode.nvim',
    ft = { 'markdown', 'pandoc', 'vimwiki' },
    opts = {
      filetype = { '*.md' },
      options = {
        insert = true,
        insert_leave = true,
        pad_separator_line = false,
        alig_style = 'default',
      },
    },
    config = function(_, opts)
      require('markdown-table-mode').setup(opts)
    end,
}
