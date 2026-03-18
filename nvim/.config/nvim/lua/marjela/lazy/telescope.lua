return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                },
                extensions = {
                    fzf = {},
                }
            })
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")
            -- grep in project
            vim.keymap.set("n", "gS", builtin.live_grep)
            -- find files in root
            vim.keymap.set("n", "<leader>fr", function()
                builtin.find_files({ cwd = "/" })
            end, {})
            -- find files in $HOME
            vim.keymap.set("n", "<leader>fh", function()
                builtin.find_files({ cwd = os.getenv("HOME") })
            end, {})
            -- find files in PWD
            vim.keymap.set("n", "<leader>ff", function()
                if pcall(function()
                        builtin.git_files({
                            cwd = require("telescope.utils").buffer_dir(),
                            show_untracked = true
                        })
                    end) == false then
                    builtin.find_files()
                end
            end, {})
            -- find buffers
            vim.keymap.set("n", "<leader>b", builtin.buffers, {})
            -- find help
            vim.keymap.set("n", "<leader>fH", builtin.help_tags, {})
        end
    }
}
