require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "json",
        "python",
        "regex",
        "toml",
        "vim",
        "yaml",
    },
    highlight = { -- enable highlighting
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    }
}
