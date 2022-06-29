local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup {
    {
        ensure_installed = { "rust_analyzer", "sumneko_lua" }
    }
}

local luasnip = require'luasnip'
local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
        },
        {
            { name = 'buffer' },
        }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        }
    )
})

-- Setup lspconfig.
local on_attach = function(_, bufnr)
    -- local keybinds, ig
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {'sumneko_lua', 'rust_analyzer'}
local lspconfig = require('lspconfig')
for _, lsp in ipairs(servers) do
    local settings = {}
    if lsp == 'sumneko_lua' then
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim', 'use', }
                }
            }
        }
    else
    end
    lspconfig[lsp].setup {
        settings = settings,
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
