-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    view = {
        side = "left",
        mappings = {
            list = {
                { key = "<C-d>", action = "cd" },
            }
        },
    },
    modified = {
        enable = true,
    },
    renderer = {
        highlight_modified = "icon",
    },
}

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
