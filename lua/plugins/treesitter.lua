return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'RRethy/nvim-treesitter-endwise'
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'css',
        'go',
        'graphql',
        'html',
        'htmldjango',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'ruby',
        'rust',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'yaml',
      },
      highlight = { enable = true },
      endwise = { enable = true },
      indent = { enable = true }
    })
  end
}
