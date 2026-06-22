vim.pack.add({"https://github.com/mfussenegger/nvim-lint"})

require("lint").linters_by_ft = {
    typescript = {"eslint_d"}
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    group = "UserConfig",
    callback = function()
        require("lint").try_lint()
    end
})
