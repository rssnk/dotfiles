vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v", "x" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v", "x" }, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>q", ":bwipeout<CR>")

vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.keymap.set("n", "<leader>cc", ":ccl<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set('n', '<leader>D', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

vim.keymap.set('n', '<C-w>C', ':bprevious | bdelete #<CR>', { silent = true, desc = 'Delete buffer, keep window' })
