return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter")

            configs.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "typescript",
                    "tsx",
                    "javascript",
                    "lua",
                    "c",
                    "vim",
                    "ruby",
                    "graphql",
                },
            })
        end,
    },
}
