vim.g.mapleader = " "
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)

-- move lines with alt-j and alt-k
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- keep the cursor in place when doing search stuff
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- leader p to paste without copy to buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- leader y to copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- move between splits
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, {
    desc = "Toggle File Explorerer"
})
-- snippets
vim.api.nvim_set_keymap('n', '<leader>gg', [[:<C-u>lua vim.fn.append(vim.fn.line('.'), 'if err != nil {')<CR>:<C-u>lua vim.fn.append(vim.fn.line('.')+1, '    return err')<CR>:<C-u>lua vim.fn.append(vim.fn.line('.')+2, '}')<CR>:noh<CR>jjj]], { noremap = true, silent = true })
