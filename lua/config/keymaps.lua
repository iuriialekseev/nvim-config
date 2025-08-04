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
map('n', ']q', ':cnext<cr>zz', opts)
map('n', '[q', ':cprev<cr>zz', opts)

local copy_path = function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ':~:.')
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

local copy_path_line = function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ':~:.')
  path = path .. ":" .. vim.fn.line('.')
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

map('n', '<leader>p', copy_path, opts)
map('n', '<leader>P', copy_path_line, opts)

map('n', '<leader>o', ':LLMPrompt %<CR>')


vim.api.nvim_create_user_command('CopyQuickfixFiles', function()
  local qf_list = vim.fn.getqflist()
  local file_list = {}
  for _, v in ipairs(qf_list) do
    if v.valid == 1 and v.bufnr > 0 then
      local bufname = vim.fn.bufname(v.bufnr)
      if bufname ~= '' then
        local abs_path = vim.fn.fnamemodify(bufname, '%:p')
        table.insert(file_list, abs_path)
      end
    end
  end
  local result = table.concat(file_list, "\n")
  vim.fn.setreg('+', result)
end, {})


local function delete_qf_items_operator(type)
    local start_idx, end_idx

    if type == 'line' then
        -- Linewise operation
        start_idx = vim.fn.line("'[")
        end_idx = vim.fn.line("']")
    elseif type == 'char' then
        -- Characterwise operation
        start_idx = vim.fn.line("'[")
        end_idx = vim.fn.line("']")
    elseif type == 'v' or type == 'V' then
        -- Visual mode
        start_idx = vim.fn.line("'<")
        end_idx = vim.fn.line("'>")
    else
        return
    end

    local count = end_idx - start_idx + 1
    local qflist = vim.fn.getqflist()

    -- Remove items in reverse order to maintain correct indices
    for i = end_idx, start_idx, -1 do
        table.remove(qflist, i)
    end

    vim.fn.setqflist(qflist, 'r')
    vim.fn.cursor(start_idx, 1)
end

-- Set up the operator
local function delete_qf_setup()
    vim.o.operatorfunc = "v:lua.delete_qf_items_operator"
    return "g@"
end

-- Make the function available in the global environment
_G.delete_qf_items_operator = delete_qf_items_operator

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        -- Do not show quickfix in buffer lists.
        vim.api.nvim_buf_set_option(0, 'buflisted', false)
        -- Escape closes quickfix window.
        vim.keymap.set(
            'n',
            '<ESC>',
            '<CMD>cclose<CR>',
            { buffer = true, remap = false, silent = true }
        )

        -- 'dd' as a dot-repeatable deletion
        vim.keymap.set('n', 'dd', function()
            vim.o.operatorfunc = "v:lua.delete_qf_items_operator"
            return vim.api.nvim_feedkeys("g@_", 'n', false)
        end, { buffer = true, expr = true })

        -- 'd' as a dot-repeatable operator
        vim.keymap.set('n', 'd', delete_qf_setup, { buffer = true, expr = true })

        -- Visual mode mapping
        vim.keymap.set('x', 'd', function()
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<esc>", true, false, true),
                'x',
                false
            )
            vim.o.operatorfunc = "v:lua.delete_qf_items_operator"
            vim.api.nvim_feedkeys("g@`<", 'n', false)
        end, { buffer = true })
    end,
    desc = 'Quickfix tweaks',
})


map('n', '<leader>o', ':!llm_prompt %<CR><CR>')
