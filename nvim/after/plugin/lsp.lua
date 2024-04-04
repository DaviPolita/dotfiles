local lsp = require('lsp-zero').preset({ "recommended" })
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = {
    behavior = cmp.SelectBehavior.Select
}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Enter>'] = cmp.mapping.confirm({
        select = true
    }),
    ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


lsp.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false
    }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    --    lsp.buffer_autoformat()
end)



cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    --    mapping = cmp.mapping.preset.insert({
    --        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --        ["<C-Space>"] = cmp.mapping.complete(),
    --    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

lsp.setup()
