return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'rust_analyzer',
        'solargraph',
        'lua_ls',
        'taplo',
        'tsserver',
      },
    })
  end
}
