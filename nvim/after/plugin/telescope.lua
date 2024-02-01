local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

--vim.keymap.set('n', '<C-p>', function()
--    builtin.find_files({
--        cwd = utils.buffer_dir() 
--}) 
--end, {
--    desc = "Find File"
--})

vim.keymap.set('n', '<C-p>', builtin.find_files, {
    desc = "Find File"
})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {
    desc = "Find File"
})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {
    desc = "Find File in Git Repo"
})
vim.keymap.set('n', '<leader>fw', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    })
end, {
    desc = "Search with Grep"
})
