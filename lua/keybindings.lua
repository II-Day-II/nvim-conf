local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true}
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end
-- ctrl-s to save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>', {})
-- ctrl-hjkl to navigate splits
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
-- nvim-tree toggle
nkeymap('<c-b>', ':NvimTreeToggle<cr>')
