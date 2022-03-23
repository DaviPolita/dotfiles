local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    highlight = {
       enable = true,
       disable = {},
    },
    indent = {
        enable = true,
        disable = {"yaml"},
    },
ensure_installed = {
    "vim",
    "lua",
    "toml",
    "json",
    "yaml",
    "html",
    "css",
    "c",
    "javascript",
    "typescript",
    "python",
    "tsx",
    },
}
