return {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
      local api = vim.api
      local map = vim.keymap.set
      local diagnostic = vim.diagnostic

      map('n', '<leader>d', diagnostic.open_float)
      map('n', '<leader>e', diagnostic.setloclist)
      map('n', '[d', diagnostic.goto_prev)
      map('n', ']d', diagnostic.goto_next)

      api.nvim_create_autocmd('LspAttach', {
        group = api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local buf = vim.lsp.buf
          local opts = { buffer = ev.buf }
          local format = function()
            buf.format({ async = true })
          end
          local list_workspace_folders = function()
            print(vim.inspect(buf.list_workspace_folders()))
          end

          map('n', 'gD', buf.declaration, opts)
          map('n', 'gd', buf.definition, opts)
          map('n', 'gi', buf.implementation, opts)
          map('n', 'gt', buf.type_definition, opts)
          map('n', 'gr', buf.references, opts)
          map('n', 'K', buf.hover, opts)
          map('n', '<C-k>', buf.signature_help, opts)
          map('n', '<leader>r', buf.rename, opts)
          map('n', '<leader>a', buf.code_action, opts)
          map('v', '<leader>a', buf.code_action, opts)
          map('n', '<leader>=', format, opts)
          map('v', '<leader>=', format, opts)
          map('n', '<leader>wa', buf.add_workspace_folder, opts)
          map('n', '<leader>wr', buf.remove_workspace_folder, opts)
          map('n', '<leader>wl', list_workspace_folders, opts)
        end,
      })

      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local lsp = vim.lsp
      local base_capabilities = vim.lsp.protocol.make_client_capabilities()
      local default_capabilities = lsp.config['*'] and lsp.config['*'].capabilities

      if default_capabilities then
        base_capabilities = vim.tbl_deep_extend('force', base_capabilities, default_capabilities)
      end

      lsp.config('*', {
        capabilities = cmp_nvim_lsp.default_capabilities(base_capabilities),
      })

      local function execute_command(command)
        vim.lsp.buf.execute_command({
          command = command,
          arguments = { vim.api.nvim_buf_get_name(0) },
        })
      end

      lsp.config('solargraph', {
        settings = {
          solargraph = {
            diagnostics = false,
            formatting = true,
            useBundler = true,
          },
        },
      })

      lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      lsp.config('ts_ls', {
        commands = {
          TypescriptOrganizeImports = {
            function()
              execute_command("_typescript.organizeImports")
            end,
          },
          TypescriptAddMissingImports = {
            function()
              execute_command("_typescript.addMissingImports")
            end,
          },
          TypescriptFixAll = {
            function()
              execute_command("_typescript.fixAll")
            end,
          },
          TypescriptRemoveUnused = {
            function()
              execute_command("_typescript.removeUnused")
            end,
          },
        },
      })

      local servers = {
        'pyright',
        'solargraph',
        'lua_ls',
        'ts_ls',
        'gopls',
        'terraformls',
      }

      for _, server in ipairs(servers) do
        lsp.enable(server)
      end
    end,
  }
