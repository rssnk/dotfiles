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

vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        -- get current worktree
        local git_root = vim.fs.root(0, ".git")
        if git_root then
            vim.b.git_worktree = vim.fn.system(
                'cd ' .. git_root .. ' && '
                .. 'git rev-parse --show-toplevel | '
                .. 'sed -E \'s|.*/([^/]+)$|\\1|\''
            ):sub(1, -2) .. ':'
        else
            vim.b.git_worktree = nil
        end
    end
})
