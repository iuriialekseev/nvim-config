return {
  "ggandor/leap.nvim",
  keys = { "s", "S", "gs" },
  config = function()
    local leap = require('leap')
    leap.opts.case_sensitive = true
    leap.add_default_mappings()
  end,
}
