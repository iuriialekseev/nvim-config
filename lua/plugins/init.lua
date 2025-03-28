return {
  -- autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end
  },

  -- nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
      'windwp/nvim-autopairs',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        })
      })

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
          { name = 'buffer' },
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'cmdline' },
          { name = 'path' },
          { name = 'buffer' },
        })
      })
    end
  },

  -- vim-commentary
  {
    'tpope/vim-commentary'
  },

  -- copilot-cmp
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -- copilot
  {
    'zbirenbaum/copilot.lua',
    keys = {
      { '<leader>GCE', ':Copilot enable' },
      { '<leader>GCD', ':Copilot disable' },
    },
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false
        },
        panel = {
          enabled = false
        },
        filetypes = {
          markdown = true,
          yaml = true,
        },
      })
    end
  },

  -- fugitive
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
    },
    keys = {
      { '<leader>s',  ':0Git<cr>' },
      { '<leader>b',  ':Git blame<cr>' },
      { '<leader>gx', ":GBrowse<cr>" },
      { '<leader>gl', ":'<,'>Gclog --follow<cr>" },
      { '<leader>gg', ':0Gclog --follow -i --grep ""<left>' },
      { '<leader>gs', ':0Gclog --follow -S ""<left>' },
      { '<leader>gc', ':0Gclog --follow<cr>' },
      { '<leader>gG', ':Gclog -i --grep ""<left>' },
      { '<leader>gS', ':Gclog -S ""<left>' },
      { '<leader>gC', ':Gclog -100<cr>' },
    }
  },

  -- lspconfig
  {
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

      local lspconfig = require('lspconfig')
      local lsp_defaults = lspconfig.util.default_config
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        cmp_nvim_lsp.default_capabilities()
      )

      local function execute_command(command)
        vim.lsp.buf.execute_command({
          command = command,
          arguments = { vim.api.nvim_buf_get_name(0) },
        })
      end

      lspconfig.pyright.setup {}

      lspconfig.solargraph.setup {
        settings = {
          solargraph = {
            diagnostics = false,
            formatting = true,
            useBundler = true,
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
      }

      lspconfig.ts_ls.setup {
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
          }
        }
      }

      lspconfig.gopls.setup {}
      lspconfig.terraformls.setup {}
    end,
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
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
          lualine_y = { 'filetype' },
          lualine_z = { 'progress' },
        },
      })
    end
  },

  -- luasnip
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_snipmate').lazy_load()
    end
  },

  -- mason-lspconfig
  {
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
          'ts_ls', -- js/ts
        },
      })
    end
  },

  -- mason
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
    end
  },

  -- nvim-surround
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>n', ':NvimTreeToggle<cr>' },
      { '<leader>N', ':NvimTreeFindFile<cr>' },
    },
    config = function()
      require('nvim-tree').setup({
        renderer = {
          root_folder_label = false,
        },
        view = {
          adaptive_size = true,
        },
        live_filter = {
          prefix = ' > ',
          always_show_folders = false,
        },
        git = {
          ignore = false,
        },
      })
    end
  },

  -- smoothie (smooth scroll)
  {
    'psliwka/vim-smoothie'
  },

  -- tabout (press tab to exit brackets/quotes)
  {
    'abecodes/tabout.nvim',
    dependencies = {
      'nvim-treesitter',
      'nvim-cmp',
    },
    config = function()
      require('tabout').setup({})
    end
  },

  -- telescope-fzf
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = false,
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    keys = {
      { '<leader>f', ':Telescope find_files<cr>' },
      { '<leader>l', ':Telescope live_grep<cr>' },
      { '<leader>L', ':Telescope grep_string<cr>' },
      { '<leader>?', ':Telescope help_tags<cr>' },
    },
    config = function()
      local o = vim.o
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          file_ignore_patterns = { '.git/' },
          layout_strategy = 'vertical',
          layout_config = {
            height = o.lines,
            width = o.columns,
            prompt_position = 'top',
            preview_height = 0.5,
          },
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.add_to_qflist + actions.open_qflist,
              ["<M-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function(_)
              return { '--hidden' }
            end,
          },
        },
      })

      telescope.load_extension('fzf')
    end
  },

  -- theme (catppuccin)
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        integrations = {
          cmp = true,
          nvimtree = true,
          telescope = true,
          markdown = true,
          mason = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          treesitter = true,
        },
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },

  -- tidy (remove trailing whitespace and blank lines)
  {
    'mcauley-penney/tidy.nvim',
    config = function()
      require('tidy').setup()
    end
  },

  -- treesitter
  {
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
          'dockerfile',
          'elixir',
          'embedded_template',
          'go',
          'graphql',
          'hcl',
          'html',
          'java',
          'javascript',
          'json',
          'lua',
          'markdown',
          'python',
          'ruby',
          'rust',
          'scss',
          'terraform',
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
  },

  -- treesj
  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      { '<leader>j', ':TSJJoin<cr>' },
      { '<leader>k', ':TSJSplit<cr>' },
    },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },

  -- yaml
  {
    'cuducos/yaml.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    keys = {
      { '<leader>y', ':YAMLYankKey +<cr>' },
    },
    config = function()
      require('nvim-surround').setup({})
    end
  },
}
