return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cd",
            function()
                vim.g.disable_autoformat = true
            end,
            desc = "Conform Dissable",
        },
        {
            "<leader>ce",
            function()
                vim.g.disable_autoformat = false
            end,
            desc = "Conform Enable",
        },
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Conform Format",
        },
    },
    opts = {
        formatters_by_ft = {
            nix = { "nixfmt" },
            lua = { "stylua" },
            css = { "stylelint", "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            rust = { "rustfmt" },
            go = { "gofmt" },
            proto = { "buf" },
            python = { "black" },
            ruby = { "prettier" },
            eruby = { "prettier" },
            markdown = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            sass = { "prettier" },
            scss = { "prettier" },
        },
        format_on_save = function()
            if vim.g.disable_autoformat then
                return
            end
            return { timeout_ms = 5000, lsp_format = "fallback" }
        end,
    },
}
