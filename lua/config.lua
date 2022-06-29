-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- color
vim.o.background = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[colorscheme vscode]])

-- row numbers
vim.opt.number = true

-- enable treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
