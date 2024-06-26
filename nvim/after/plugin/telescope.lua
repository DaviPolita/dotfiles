require('telescope').setup { defaults = { file_ignore_patterns = { "vendor" } } }
local builtin = require('telescope.builtin')


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
