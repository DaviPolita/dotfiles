local lsp = require('lsp-zero').preset({"recommended"})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
	['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
	['<Enter>'] = cmp.mapping.confirm({select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
 -- lsp.default_keymaps({buffer = bufnr})
 local opts = {buffer = bufnr, remap = false}

 vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
 vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
