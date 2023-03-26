-- remove trailing whitespace and blank lines
return {
  'mcauley-penney/tidy.nvim',
  config = function()
    require('tidy').setup()
  end
}
