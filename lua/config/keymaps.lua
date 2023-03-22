local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader to space
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- source configuration file
map('n', '<leader>/', ':source $MYVIMRC<cr>', opts)

-- clear search highlight
map('n', '<leader><leader>', ':noh<cr>', opts)

-- move around splits and buffers
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
map('n', ']q', ':cnext<cr>', opts)
map('n', '[q', ':cprev<cr>', opts)

-- git
map('n', '<leader>s', '<cmd>:0G<cr>', opts)
map('n', '<leader>B', '<cmd>:Git blame<cr>', opts)
map('n', '<leader>h', '<cmd>:0Gclog<cr>', opts)
map('n', '<leader>d', '<cmd>:Gdiffsplit!<cr>', opts)
map('n', '<leader>D', '<cmd>:Gdiffsplit<cr>', opts)

-- telescope
map('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>l', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>?', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>q', '<cmd>:copen<cr>', opts)

-- nvim-tree
map('n', '<leader>n', '<cmd>:NvimTreeToggle<cr>', opts)
map('n', '<leader>N', '<cmd>:NvimTreeFindFile<cr>', opts)

-- copy file relative path
local local_path = "fnamemodify(expand('%'), ':~:.')"
map('n', '<leader>p', '<cmd>:let @+=' .. local_path .. '<cr>', opts)
map('n', '<leader>P', '<cmd>:let @+=' .. local_path .. '. ":" . line(".")<cr>', opts)

-- copy yaml path
local yaml_path_1 = "substitute(" .. local_path .. ", '/_', '/', 'g')"
local yaml_path_2 = "substitute(" .. yaml_path_1 .. ", '/', '.', 'g')"
local yaml_path_3 = "substitute(" .. yaml_path_2 .. ", 'app.views.', '', 'g')"
local yaml_path = "substitute(" .. yaml_path_3 .. ", '.html.haml', '', 'g')"
map('n', '<leader>Y', "it('<C-r>=" .. yaml_path .. "<cr>')", opts)
map('n', '<leader>y', '<cmd>YAMLYankKey +<cr>', opts)

-- vimwiki
-- align table
map('n', '<leader>tl', '<cmd>:s/\\v[^|]+/---/g<cr>i<esc><cmd>:noh<cr>', opts)
map('n', '<leader>tr', '<cmd>:s/\\v[^|]+/---:/g<cr>i<esc><cmd>:noh<cr>', opts)
map('n', '<leader>tm', '<cmd>:s/\\v[^|]+/:---:/g<cr>i<esc><cmd>:noh<cr>', opts)
