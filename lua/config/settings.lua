local g = vim.g
local opt = vim.opt

-- allow mouse clicks
opt.mouse = 'a'

-- show rel/abs line numbers
opt.number = true
opt.relativenumber = true

-- smart case search
opt.ignorecase = true
opt.smartcase = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true

-- cursor "padding" measured in lines
opt.scrolloff = 4


-- default split positions
opt.splitbelow = true
opt.splitright = true

-- highlight current line
opt.cursorline = true

-- completion options for insert mode
opt.completeopt = 'menu,menuone,noselect'

-- for global lualine to work
opt.laststatus = 3

-- yank will copy to clipboard
opt.clipboard = 'unnamedplus'

-- netrw
g.netrw_banner = 0 -- hide header
g.netrw_liststyle = 3 -- tree view

-- disable unused providers
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0

-- vsnip
g.vsnip_snippet_dir = '~/.config/nvim/vsnip'

-- vimwiki
g.vimwiki_list = {
  {
    syntax = 'markdown',
    ext = '.md',
  }
}
