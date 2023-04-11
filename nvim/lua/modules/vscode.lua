print("Loading vscode.lua")
-- Remove the ~/after directory from the runtimepath
local rpath = vim.o.runtimepath:gsub(",*\\after", "")
-- print(rpath)
vim.api.nvim_set_option("runtimepath", rpath)

-- Set shada to "NONE"
-- vim.opt.shada = "NONE"
--
vim.api.nvim_exec("language en_US", true)

-- Set shell to powershell.exe
vim.opt.shell = "powershell.exe"

-- Add line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- splits navigation
vim.api.nvim_set_keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("x", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("x", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", {
    silent = true
})

-- tab to navigate
vim.api.nvim_set_keymap("n", "<Tab>", ":Tabnext<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":Tabprev<CR>", {
    silent = true
})

-- keep cursor centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", {
    silent = true
})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {
    silent = true
})
