return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        {
            "kiennt63/harpoon-files.nvim",
            dependencies = {
                { "ThePrimeagen/harpoon" },
            },
            opts = {
                show_icon = false,
                separator_left = "",
                separator_right = "",
            },
        },
    },
    config = function()
        local harpoon_files = require("harpoon_files")

        require("lualine").setup({
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { { harpoon_files.lualine_component } },
                lualine_x = { "filename" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
