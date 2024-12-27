local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"ellisonleao/gruvbox.nvim",
			init = function()
				vim.cmd("colorscheme gruvbox")
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			},
		},
		{
			"brenoprata10/nvim-highlight-colors",
			opts = {
				render = "virtual",
				virtual_symbol = "⏹",
				enable_tailwind = true,
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				require("nvim-treesitter.install").update({ with_sync = true })()
			end,
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = {
						"nix",
						"javascript",
						"typescript",
						"python",
						"lua",
						"rust",
						"json",
						"html",
						"css",
						"scss",
						"go",
						"yaml",
						"bash",
						"csv",
						"dockerfile",
						"gitignore",
						"gitcommit",
						"make",
						"tsx",
					},
				})
			end,
		},
		{
			"stevearc/conform.nvim",
			branch = "nvim-0.9",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			keys = {
				{
					"<leader>c",
					function()
						require("conform").format({ async = true })
					end,
					mode = { "n", "v" },
					desc = "Format buffer",
				},
			},
			opts = {
				formatters_by_ft = {
					nix = { "nixfmt" },
					lua = { "stylua" },
					css = { "stylelint" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					rust = { "rustfmt" },
					go = { "gofmt" },
					proto = { "buf" },
					python = { "black" },
				},
			},
		},
		{
			"kylechui/nvim-surround",
			opts = {},
		},
		{
			"ggandor/leap.nvim",
			keys = {
				{
					"s",
					"<Plug>(leap)",
					mode = { "n" },
					desc = "Leap in buffer",
				},
				{
					"S",
					"<Plug>(leap-from-window)",
					mode = { "n" },
					desc = "Leap from window",
				},
			},
		},
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
			keys = {
				{
					"<leader>ha",
					function()
						require("harpoon"):list():add()
					end,
					mode = { "n" },
					desc = "Add Buffer To Harpoon",
				},
				{
					"<leader>hw",
					function()
						require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
					end,
					mode = { "n" },
					desc = "Toggle Harpoon List",
				},
				{
					"<leader>hd",
					function()
						require("harpoon"):list():remove()
					end,
					mode = { "n" },
					desc = "Remove Buffer From Harpoon",
				},
				{
					"<leader>h1",
					function()
						require("harpoon"):list():select(1)
					end,
					mode = { "n" },
					desc = "Switch To Buffer 1",
				},
				{
					"<leader>h2",
					function()
						require("harpoon"):list():select(2)
					end,
					mode = { "n" },
					desc = "Switch To Buffer 2",
				},
				{
					"<leader>h3",
					function()
						require("harpoon"):list():select(3)
					end,
					mode = { "n" },
					desc = "Switch To Buffer 3",
				},
				{
					"<leader>h4",
					function()
						require("harpoon"):list():select(4)
					end,
					mode = { "n" },
					desc = "Switch To Buffer 4",
				},
				{
					"<leader>h5",
					function()
						require("harpoon"):list():select(5)
					end,
					mode = { "n" },
					desc = "Switch To Buffer 5",
				},
			},
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
				--"3rd/image.nvim",
			},
			keys = {
				{
					"<leader>t",
					"<cmd>:Neotree toggle<CR>",
					mode = { "n" },
					desc = "Toggle file tree",
				},
			},
			opts = {
				window = {
					position = "current",
				},
				filesystem = {
					filtered_items = {
						visible = true,
					},
				},
			},
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" },
			keys = {
				{
					"<leader>ff",
					function()
						require("telescope.builtin").find_files()
					end,
					mode = { "n" },
					desc = "Find file",
				},
				{
					"<leader>ft",
					function()
						require("telescope.builtin").treesitter()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>flr",
					function()
						require("telescope.builtin").lsp_references()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fld",
					function()
						require("telescope.builtin").lsp_definitions()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fli",
					function()
						require("telescope.builtin").lsp_implementations()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>flt",
					function()
						require("telescope.builtin").lsp_type_definitions()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fg",
					function()
						require("telescope.builtin").live_grep()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fs",
					function()
						require("telescope.builtin").grep_string()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fb",
					function()
						require("telescope.builtin").current_buffer_fuzzy_find()
					end,
					mode = { "n" },
					desc = "",
				},
				{
					"<leader>fd",
					function()
						require("telescope.builtin").diagnostics()
					end,
					mode = { "n" },
					desc = "",
				},
			},
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"hrsh7th/cmp-path",
				"L3MON4D3/LuaSnip",
			},
			config = function()
				local cmp = require("cmp")

				cmp.setup({
					experimental = { ghost_text = true },
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = {
						["<C-k>"] = cmp.mapping.select_prev_item(),
						["<C-j>"] = cmp.mapping.select_next_item(),
						["<C-i>"] = cmp.mapping.scroll_docs(-4),
						["<C-o>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
						["<CR>"] = cmp.mapping.confirm({ select = false }),
					},
					sources = cmp.config.sources({
						{ name = "nvim_lsp", keyword_length = 1 },
						{ name = "nvim_lsp_signature_help" },
						{ name = "luasnip" },
						{ name = "path" },
						{ name = "nvim_lua" },
					}, {
						{ name = "buffer" },
					}),
				})

				cmp.setup.cmdline({ "/", "?" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "buffer" } },
				})

				cmp.setup.cmdline({ ":" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "cmdline" }, { name = "path" } },
				})
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
			keys = {
				{
					"\\]",
					function()
						require("luasnip").jump(1)
					end,
					desc = "Jump forward a snippet placement",
					mode = "i",
				},
				{
					"\\[",
					function()
						require("luasnip").jump(-1)
					end,
					desc = "Jump backward a snippet placement",
					mode = "i",
				},
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{
			"arnamak/stay-centered.nvim",
			opts = {},
		},
		{
			"williamboman/mason.nvim",
			opts = {},
		},
	},
	install = { colorscheme = { "gruvbox" } },
})
