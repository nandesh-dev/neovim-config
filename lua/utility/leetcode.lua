return {
    "kawre/leetcode.nvim",
    lazy = "leetcode" ~= vim.fn.argv(0, -1),
    opts = { arg = "leetcode" },
}
