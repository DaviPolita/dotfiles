vim.api.nvim_exec('language en_US', true)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- open and close the NvimTree
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function()
        vim.cmd("NvimTreeClose")
    end
})
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
        vim.cmd("NvimTreeOpen")
    end
})
