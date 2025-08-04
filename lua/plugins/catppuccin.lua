return {
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
  }
