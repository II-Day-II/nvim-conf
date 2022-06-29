require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        side = "left",
        mappings = {
            list = {
                { key = "<C-d>", action = "cd" },
            }
        },
    },
}
