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
map('n', '<leader>c', ':bd<cr>', opts)
map('n', '<leader>C', ':%bd!|e#|bd!#<cr>', opts)

-- quickfix
map('n', '<leader>q', ':copen | resize 10<cr>', opts)
map('n', ']q', ':cnext<cr>', opts)
map('n', '[q', ':cprev<cr>', opts)

-- copy local path to the clipboard
local copy_path = function(line)
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ':~:.')
  if line then
    path = path .. ":" .. vim.fn.line('.')
  end
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

local copy_path_without_line = function() copy_path() end
local copy_path_with_line = function() copy_path(true) end

map('n', '<leader>p', copy_path_without_line, opts)
map('n', '<leader>P', copy_path_with_line, opts)
