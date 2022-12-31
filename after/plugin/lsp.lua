local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'sumneko_lua',
    'rust_analyzer',
    'pylsp',
})

-- fix "Undefinde global 'vim'"
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>nd', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>pd', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<C-L>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
