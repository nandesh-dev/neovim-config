vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
