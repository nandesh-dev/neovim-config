return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon Add",
        },
        {
            "<leader>hw",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Harpoon Window",
        },
        {
            "<leader>hd",
            function()
                require("harpoon"):list():remove()
            end,
            desc = "Harpoon Delete",
        },
        {
            "<leader>h1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon 1",
        },
        {
            "<leader>h2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon 2",
        },
        {
            "<leader>h3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon 3",
        },
        {
            "<leader>h4",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon 4",
        },
        {
            "<leader>h5",
            function()
                require("harpoon"):list():select(5)
            end,
            desc = "Harpoon 5",
        },
    },
}
