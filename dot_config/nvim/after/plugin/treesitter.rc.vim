if !exists("g:laoded_nvim_treesitter")
    finish
endif

lua << EOF
    require'nvim-treesitter.configs'.setup {
        highlight = {
           enable = true,
           disable = {},
        },
        indent = {
            enable = false,
            disable = {},
        },
    ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "json",
        "yaml",
        "swift",
        "html",
        "css",
        },
    }
EOF

"local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
"parser_config.tsx.used_by = { "javascript", "typescript.tsx", "c" }
