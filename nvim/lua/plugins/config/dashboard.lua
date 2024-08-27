local db = require('dashboard')

db.setup({
    theme = 'doom',
    config = {
        header = {
            '                                           ',
            '  CCCCCCCC         ZZZZZZZZZZZ    XX      XX  ',
            ' CC      CC               ZZ      XX    XX   ',
            'CC                     ZZ         XX  XX    ',
            'CC                    ZZ           XXXX     ',
            'CC                   ZZ             XX      ',
            'CC                  ZZ             XXXX     ',
            'CC     CC          ZZ            XX  XX    ',
            ' CC     CC        ZZ            XX    XX   ',
            '  CCCCCCCC   ZZZZZZZZZZZZZZZ    XX      XX  ',
            '                                           ',
        },
        center = {
            {
                icon = "󰈞  ",
                desc = "Find  File                              ",
                action = "Leaderf file --popup",
                key = "<Leader>ff",
            },
            {
                icon = "󰈢  ",
                desc = "Recently opened files                   ",
                action = "Leaderf mru --popup",
                key = "<Leader>fr",
            },
            {
                icon = "󰈬  ",
                desc = "Project grep                            ",
                action = "Leaderf rg --popup",
                key = "<Leader>fg",
            },
            {
                icon = "  ",
                desc = "Open Nvim config                        ",
                action = "tabnew $MYVIMRC | tcd %:p:h",
                key = "<Leader>ev",
            },
            {
                icon = "  ",
                desc = "New file                                ",
                action = "enew",
                key = "e",
            },
            {
                icon = "󰗼  ",
                desc = "Quit Nvim                               ",
                -- desc = "Quit Nvim                               ",
                action = "qa",
                key = "q",
            },
        },
        footer = function()
            local footer = { '', '🎉 Have fun with neovim' }
            local ok, lazy = pcall(require, 'lazy') -- 尝试加载 lazy.nvim 模块

            if ok and lazy then
                local plugins = lazy.plugins()
                local count = #vim.tbl_keys(plugins)
                footer[3] = '🎉 neovim loaded ' .. count .. ' plugins'
            end

            return footer
        end
    }
})

return db
