return {
    "pocco81/auto-save.nvim",
    opts = {
        trigger_events = { "InsertLeave", "TextChanged" },
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                return true -- met condition(s), can save
            end
            return false -- can't save
        end,
        write_all_buffers = false,
        debounce_delay = 1000,
    },
    keys = {
        {
            "<leader>ast",
            ":ASToggle<CR>",
            desc = "Auto Save Toggle",
        },
    },
}
