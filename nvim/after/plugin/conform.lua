require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
    },
    --format_on_save = {
    --    -- These options will be passed to conform.format()
    --    timeout_ms = 500,
    --    lsp_fallback = true,
    --},
})

vim.keymap.set('x', '<leader>f', function()
    require("conform").format({ async = true, lsp_fallback = true })
end)

vim.keymap.set('n', '<leader>F', function()
    -- Save the current cursor position
    local saved_cursor = vim.api.nvim_win_get_cursor(0)
    -- Select the entire file
    vim.api.nvim_exec('normal! ggVG', false)
    -- Apply the conform function to the selected       range
    require("conform").format({ async = true, lsp_fallback = true })
    -- Restore the cursor to its original position
    vim.api.nvim_win_set_cursor(0, saved_cursor)
end, { silent = true })
