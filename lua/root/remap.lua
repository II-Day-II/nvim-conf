vim.g.mapleader = " "

local keymap = vim.keymap.set
-- keymap('n', '<leader>pv', vim.cmd.Ex)

-- move highlight up/down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--half page movement
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- paste doesn't cut
keymap("x", "p", "\"_dP")

-- I don't need ctrl-c
keymap("i", "<C-c>", "<Esc>")

-- I don't know what Q does, so I don't need it
keymap("n", "Q", "<nop>")

-- replace word under cursor through file
keymap("n", "<leader>l", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

