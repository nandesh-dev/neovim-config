return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "nix",
                "javascript",
                "typescript",
                "python",
                "lua",
                "rust",
                "json",
                "html",
                "css",
                "scss",
                "go",
                "yaml",
                "bash",
                "csv",
                "dockerfile",
                "gitignore",
                "gitcommit",
                "make",
                "tsx",
                "glsl",
                "proto",
            },
        })
    end,
}
