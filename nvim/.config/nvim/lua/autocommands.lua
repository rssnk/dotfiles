-- auto insert on entering term
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
    pattern = "term://*",
    callback = function()
        vim.cmd.startinsert()
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.cmd("compiler gcc")
        vim.opt_local.commentstring = '// %s'
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.cmd("compiler go")
    end,
})
