return {
    {
        "ibhagwan/fzf-lua",
        -- or if using mini.icons/mini.nvim
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostic disable: missing-fields
        opts = {
            keymap = {
                fzf = {
                    -- use cltr-q to select all items and convert to quickfix list
                    ["ctrl-q"] = "select-all+accept",
                },
            },
        },
        ---@diagnostic enable: missing-fields
    }
}
