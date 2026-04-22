return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = 15,
        open_mapping = nil, -- disable default mapping
        shade_terminals = true,
        direction = "horizontal", -- change to "float" if you prefer
        persist_size = true,
        persist_mode = true,
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)

        local Terminal = require("toggleterm.terminal").Terminal

        -- Create terminals (scoped locally, not global)
        local terms = {
            Terminal:new({ hidden = true }),
            Terminal:new({ hidden = true }),
            Terminal:new({ hidden = true }),
            Terminal:new({ hidden = true }),
        }

        -- Keymaps
        for i, term in ipairs(terms) do
            vim.keymap.set("n", "<leader>" .. i, function()
                term:toggle()
            end, { desc = "Toggle terminal " .. i })
        end

        -- OPTIONAL: preload all terminals at startup
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                for _, term in ipairs(terms) do
                    term:spawn()
                end
            end,
        })

        vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
            desc = "Exit terminal mode",
        })
    end,
}
