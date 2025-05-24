return {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000,
    config = function()
        require("evergarden").setup({
            theme = {
                variant = "spring",
            },
        })
        vim.cmd("colorscheme evergarden")
    end,
}
