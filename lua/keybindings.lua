local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true}
local function nnoremap(key, map)
    keymap('n', key, map, opts)
end
-- set ctrl-space to Esc
keymap('i', '<c-space>',  '<Esc>', {})
keymap('v', '<c-space>',  '<Esc>', {})
keymap('c', '<c-space>',  '<Esc>', {})
keymap('o', '<c-space>',  '<Esc>', {})
-- ctrl-s to save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>', {})
-- ctrl-hjkl to navigate splits
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
-- nvim-tree toggle
nnoremap('<c-b>', ':NvimTreeToggle<cr>')
-- set leader to space (backslash is awkward)
vim.g.mapleader = ' '
