require('copilot').setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    yaml = true,
    markdown = true,
    gitcommit = true,
    gitrebase = true,
  },
  copilot_node_command = 'node',
})
