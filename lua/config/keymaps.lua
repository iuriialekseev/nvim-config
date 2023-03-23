local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader to space
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- sync dependencies
map('n', '<leader>u', ':Lazy sync | TSUpdateSync<cr>', opts)

-- clear search highlight
map('n', '<leader><leader>', ':noh<cr>', opts)

-- splits and buffers
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-c>', '<C-w>c', opts)
map('n', '<C-o>', '<C-w>o', opts)
map('n', '<S-l>', ':bnext<cr>', opts)
map('n', '<S-h>', ':bprev<cr>', opts)
map('n', '<leader>c', '<cmd>:bd<cr>', opts)
map('n', '<leader>C', '<cmd>:%bd!|e#|bd!#<cr>', opts)

-- quickfix
map('n', '<leader>q', '<cmd>:copen<cr>', opts)
map('n', ']q', ':cnext<cr>', opts)
map('n', '[q', ':cprev<cr>', opts)

-- copy file relative path
local local_path = "fnamemodify(expand('%'), ':~:.')"
map('n', '<leader>p', '<cmd>:let @+=' .. local_path .. '<cr>', opts)
map('n', '<leader>P', '<cmd>:let @+=' .. local_path .. '. ":" . line(".")<cr>', opts)

-- insert yaml path
local yaml_path_1 = "substitute(" .. local_path .. ", '/_', '/', 'g')"
local yaml_path_2 = "substitute(" .. yaml_path_1 .. ", '/', '.', 'g')"
local yaml_path_3 = "substitute(" .. yaml_path_2 .. ", 'app.views.', '', 'g')"
local yaml_path = "substitute(" .. yaml_path_3 .. ", '.html.haml', '', 'g')"
map('n', '<leader>Y', "it('<C-r>=" .. yaml_path .. "<cr>')", opts)
