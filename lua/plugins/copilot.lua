return {
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
      },
    })
  end
}
