return {
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            { "<leader>j", function() require("notebook-navigator").move_cell "d" end },
            { "<leader>k", function() require("notebook-navigator").move_cell "u" end },
            { "<leader>a", "<cmd>lua require('notebook-navigator').add_cell_before()<cr>" },
            { "<leader>b", "<cmd>lua require('notebook-navigator').add_cell_after()<cr>" },
            { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
            { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
        },
        dependencies = {
            "echasnovski/mini.comment", -- Commenting utility
            "Vigemus/iron.nvim",        -- REPL provider
            --"akinsho/toggleterm.nvim",      -- Alternative REPL provider
            -- "benlubas/molten-nvim",         -- Alternative REPL provider
            "anuvyklack/hydra.nvim", -- Keybinding hydra
        },
        event = "VeryLazy",
        config = function()
            local nn = require "notebook-navigator"
            nn.setup(
                {
                    activate_hydra_keys = "<leader>h",
                    -- Syntax based highlighting. If you don't want to install mini.hipattners or
                    -- enjoy a more minimalistic look
                    syntax_highlight = true,
                })
        end,
    },
    -- The lines delimiting the code cells can have pretty highlighting
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
        opts = function()
            local nn = require "notebook-navigator"

            local opts = { highlighters = { cells = nn.minihipatterns_spec } }
            return opts
        end,
    }
}
