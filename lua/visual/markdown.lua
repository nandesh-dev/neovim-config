return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {
        file_types = { "markdown", "typescript" },
        injections = {
            typescript = {
                enabled = true,
                query = [[
        ((comment) @injection.content
          (#match? @injection.content "^/\\* md")
          (#set! injection.combined)
          (#set! injection.include-children)
          (#set! injection.language "markdown"))
      ]],
            },
        },
    },
}
