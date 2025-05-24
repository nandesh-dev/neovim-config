return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        })
        vim.diagnostic.config({
            virtual_text = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = false,
        })
    end,
    keys = {
        {
            "<leader>e",
            vim.diagnostic.open_float,
            desc = "Errors",
        },
        {
            "<leader>rn",
            vim.lsp.buf.rename,
            desc = "Rename variable",
        },
    },
}
