require('packer').startup(function()
  -- allow packer to self-update
  use 'wbthomason/packer.nvim'

  -- lua functions
  use 'nvim-lua/plenary.nvim'

  -- lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'RRethy/nvim-treesitter-endwise'

  -- file browser
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly'
  }

  -- git
  use 'tpope/vim-fugitive'

  -- md
  use 'vimwiki/vimwiki'

  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-bundler'
  use 'tpope/vim-surround'

  -- copilot
  use 'zbirenbaum/copilot.lua'
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" }
  }

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'

  -- status-line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- yaml
  use {
    'cuducos/yaml.nvim',
    ft = { 'yaml' },
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim'
    },
  }

  -- auto pairs
  use 'windwp/nvim-autopairs'

  -- press tab to exit brackets/quotes
  use {
    'abecodes/tabout.nvim',
    wants = { 'nvim-treesitter' },
    after = { 'nvim-cmp' }
  }

  -- remove trailing whitespace and blank lines
  use 'mcauley-penney/tidy.nvim'

  -- smooth scroll
  use 'psliwka/vim-smoothie'

  -- theme
  use 'projekt0n/github-nvim-theme'
end)
