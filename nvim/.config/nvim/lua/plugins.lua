vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/stevearc/oil.nvim',
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/mireq/luasnip-snippets',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/tpope/vim-surround',
    'https://github.com/tpope/vim-repeat',
    'https://github.com/chrishrb/gx.nvim'
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'gopls',
        'lua_ls',
    },
    automatic_installation = true,
    automatic_enable = false -- very important
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        -- not enable formatting for clangd this formatter is very annoying
        if client.name ~= 'clangd' and client:supports_method('textDocument/formatting', { bufnr = 0 }) then
            -- format buf on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = args.buf,
                        id = client.id,
                    })
                end
            })
        end

        if client:supports_method('textDocument/foldingRange') then
            -- folding with lsp
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    end
})

vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })

local servers = { 'clangd', 'gopls', 'lua_ls' }
for _, name in pairs(servers) do
    vim.lsp.enable(name)
end


require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
        globalstatus = true
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { function()
            local bufname = vim.api.nvim_buf_get_name(0)
            if bufname:match('^oil://') then
                return bufname:gsub('^oil://', '')
            end
            return vim.fn.fnamemodify(bufname, ':~:.')
        end },
        lualine_x = {},
        lualine_y = { 'filesize', 'encoding' },
        lualine_z = { 'location' },
    }
})

vim.g.oil_permissions = true

require('oil').setup({
    columns = {
        { 'permissions' },
        { 'size' }
    },
    keymaps = {
        ['gp'] = function()
            if vim.g.oil_permissions then
                require('oil').set_columns({})
            else
                require('oil').set_columns({ 'permissions', 'size' })
            end
            vim.g.oil_permissions = not vim.g.oil_permissions
        end
    },
    skip_confirm_for_simple_edits = true
})

vim.keymap.set('n', '-', function()
    require('oil').open()
end)
vim.keymap.set('n', '_', function()
    require('oil.actions').open_cwd.callback()
end)

local ts_parsers = {
    'c', 'cpp', 'lua', 'go', 'comment', 'bash', 'sql', 'markdown', 'markdown_inline'
}
require('nvim-treesitter').install(ts_parsers)
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function() require('nvim-treesitter').update() end
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
    end
})

require('gitsigns').setup({
    -- keymaps
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- show changes
        map('n', '<leader>gs', gitsigns.preview_hunk)
        -- list hunks in cur buff
        map('n', '<leader>gl', gitsigns.setqflist)

        -- reseting
        map('n', '<leader>gr', gitsigns.reset_hunk)
        map('v', '<leader>gr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)
    end
})

vim.keymap.set('n', '<leader>gb', function()
    vim.cmd('G blame')
end)

require('snippets')
local ls = require('luasnip')
vim.keymap.set('i', '<C-j>', function() ls.expand_or_jump(1) end, { silent = true })
vim.keymap.set('i', '<S-Tab>', function() ls.jump(-1) end, { silent = true })

require('fzf-lua').setup({
    actions = {
        files = {
            true,
            ['alt-f'] = false,
        }
    },
    keymap = {
        fzf = {
            true,
            ['ctrl-q'] = 'select-all+accept',
            ['ctrl-k'] = 'kill-line',
            ['alt-f'] = 'forward-word',
        },
    },
})

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>f', function()
    fzf.files()
end, { desc = 'Fuzzy find files in pwd' })

vim.keymap.set('n', '<leader>h', function()
    fzf.files({ cwd = '~' })
end, { desc = 'Fuzzy find files in ~' })

vim.keymap.set('n', '<leader>r', function()
    fzf.files({ cwd = '/' })
end, { desc = 'Fuzzy find files in /' })

vim.keymap.set('n', '<leader>b', function()
    fzf.buffers()
end, { desc = 'Fuzzy find open buffers' })

vim.keymap.set('n', '<leader>m', function()
    fzf.manpages()
end, { desc = 'Fuzzy find manpages' })

vim.keymap.set('n', '<leader>H', function()
    fzf.helptags()
end, { desc = 'Fuzzy find help tags' })

vim.keymap.set('n', 'gS', function()
    fzf.live_grep()
end, { desc = 'Live grep through open buffers' })

vim.g.netrw_nogx = 1
require('gx').setup({
    handlers = {
        github = false,
        brewfile = false,
        package_json = false,
        jira = false,
        rust = false,
        go = true
    },
    handler_options = {
        search_engine = 'google'
    }
})
vim.keymap.set('n', 'gx', '<cmd>Browse<cr>')
