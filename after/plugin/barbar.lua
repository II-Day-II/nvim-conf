-- note: barbar is called bufferline for whatever reason
require('bufferline').setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    icons = true,
})
-- integrate with nvim-tree
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')
local function get_tree_size()
    return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
end)
nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size())
end)
-- add some bindings to switch tab 
vim.keymap.set('n', '<leader>l', ':BufferNext<CR>')
vim.keymap.set('n', '<leader>h', ':BufferPrevious<CR>')
