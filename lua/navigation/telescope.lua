return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find File",
        },
        {
            "<leader>ft",
            function()
                require("telescope.builtin").treesitter()
            end,
            desc = "Find Treesitter symbols",
        },
        {
            "<leader>flr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Find Lsp References",
        },
        {
            "<leader>fld",
            function()
                require("telescope.builtin").lsp_definitions()
            end,
            desc = "Find Lsp Definitions",
        },
        {
            "<leader>fli",
            function()
                require("telescope.builtin").lsp_implementations()
            end,
            desc = "Find Lsp Implementations",
        },
        {
            "<leader>flt",
            function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            desc = "Find Lsp Type definitions",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Find Grep",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Find String",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Fuzzy Find",
        },
        {
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Find Diagonostics",
        },
        {
            "<leader>fq",
            function()
                require("telescope.builtin").quickfix()
            end,
            desc = "Find Quickfix",
        },
        {
            "<leader>ds",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
            desc = "Document Symbols",
        },
        {
            "<leader>qp",
            "<cmd>cprevious<CR>",
            desc = "Quickfix Previous",
        },
        {
            "<leader>qn",
            "<cmd>cnext<CR>",
            desc = "Quickfix Next",
        },
        {
            "<leader>qc",
            "<cmd>cclose<CR>",
            desc = "Quickfix Close",
        },
        {
            "<leader>qo",
            "<cmd>copen<CR>",
            desc = "Quickfix Open",
        },
    },
}
