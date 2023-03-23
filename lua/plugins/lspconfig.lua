return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp'
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('v', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', '<leader>=', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
        bufmap('v', '<leader>=', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
      end
    })

    local lspconfig = require('lspconfig')
    local lsp_defaults = lspconfig.util.default_config
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      cmp_nvim_lsp.default_capabilities()
    )

    lspconfig.solargraph.setup {
      settings = {
        solargraph = {
          diagnostics = false
        }
      }
    }

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim', 'use' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }

    lspconfig.rust_analyzer.setup {}
    lspconfig.taplo.setup {}

    lspconfig.tsserver.setup {}
  end,
}
