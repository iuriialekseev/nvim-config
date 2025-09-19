local g = vim.g
local opt = vim.opt
local api = vim.api

-- allow mouse clicks
opt.mouse = 'a'

-- show relative/absolute line numbers
opt.number = true
-- opt.relativenumber = true

-- smart case search
opt.ignorecase = true
opt.smartcase = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true

-- limit amount of completions
opt.pumheight = 15

-- cursor "padding" measured in lines
opt.scrolloff = 4

-- default split positions
opt.splitbelow = true
opt.splitright = true

-- highlight current line
opt.cursorline = true

-- completion options for insert mode
opt.completeopt = 'menu,menuone,noselect'

opt.timeout = true
opt.timeoutlen = 300

-- yank will copy to clipboard
opt.clipboard = 'unnamedplus'

-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- change root directory automatically
api.nvim_create_autocmd("VimEnter", { command = 'cd %:p:h' })

-- disable unused providers
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
