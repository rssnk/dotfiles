return {
    {
        "ibhagwan/fzf-lua",
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostic disable: missing-fields
        opts = {
            actions = {
                files = {
                    true,
                    ["alt-f"] = false,
                }
            },
            keymap = {
                fzf = {
                    true,
                    -- use cltr-q to select all items and convert to quickfix list
                    ["ctrl-q"] = "select-all+accept",
                    -- ["ctrl-y"] = "paste",
                    ["ctrl-k"] = "kill-line",
                    ["alt-f"] = "forward-word",
                },
            },
        },
        keys = {
            { '<leader>f', function() require('fzf-lua').files() end,              desc = 'Fuzzy find files in pwd' },
            { '<leader>h', function() require('fzf-lua').files({ cwd = '~' }) end, desc = 'Fuzzy find files in ~' },
            { '<leader>r', function() require('fzf-lua').files({ cwd = '/' }) end, desc = 'Fuzzy find files in /' },
            { '<leader>b', function() require('fzf-lua').buffers() end,            desc = 'Fuzzy find open buffers' },
            { '<leader>m', function() require('fzf-lua').manpages() end,           desc = 'Fuzzy find help tags' },
            { '<leader>h', function() require('fzf-lua').helptags() end,           desc = 'Fuzzy find help tags' },
            { 'gS',        function() require('fzf-lua').live_grep() end,          desc = 'Live grep through open buffers' },
        }
        ---@diagnostic enable: missing-fields
    }
}
