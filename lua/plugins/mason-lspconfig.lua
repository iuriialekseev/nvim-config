return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls', -- lua
        'rust_analyzer', -- rust
        'solargraph', -- ruby
        'taplo', -- toml
        'tsserver', -- js/ts
      },
    })
  end
}
