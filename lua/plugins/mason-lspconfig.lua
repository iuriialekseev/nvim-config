return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'gopls', -- go
        'lua_ls', -- lua
        'pyright', -- python'
        'rust_analyzer', -- rust'
        'solargraph', -- ruby
        'taplo', -- toml
        'tsserver', -- js/ts
      },
    })
  end
}
