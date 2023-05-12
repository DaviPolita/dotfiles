if vim.g.vscode then
    -- VSCode extension
    require("vscode")
else
    -- ordinary Neovim
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("modules")
end
