return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>t",
            "<cmd>:Neotree toggle<CR>",
            desc = "Toggle file tree",
        },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function(file_path)
                    require("neo-tree.command").execute({ action = "close" })
                end
            },
        },
    },
}
