return {
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      theme_style = 'light_default',
      dark_float = true,
      dark_sidebar = false
    })
  end
}
