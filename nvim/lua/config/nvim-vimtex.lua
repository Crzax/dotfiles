local M = {}

M.setup = function()
    -- Set the TeX flavor to LaTeX
    vim.g.tex_flavor = 'latex'

    -- Disable the quickfix mode for vimtex
    vim.g.vimtex_quickfix_mode = 0

    -- Set the view method for vimtex to general
    vim.g.vimtex_view_method = 'general'
    
    -- Set the general viewer for vimtex (SumatraPDF in this case)
    vim.g.vimtex_view_general_viewer = 'D:\\ruanjian\\SumatraPDF\\SumatraPDF.exe'

    -- Configure the options for the general viewer
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

    -- Set a key mapping for toggling the table of contents (TOC) in normal mode
    vim.api.nvim_set_keymap('n', '<leader>s', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
    
    -- Configure the TOC settings for vimtex
    vim.g.vimtex_toc_config = {
        name = 'TOC',                          -- Name of the TOC window
        layers = {'content', 'todo', 'include'}, -- Layers to be shown in the TOC
        split_width = 25,                      -- Width of the TOC window
        todo_sorted = 0,                       -- Whether to sort TODOs
        show_help = 1,                         -- Whether to show help
        show_numbers = 1,                      -- Whether to show line numbers
    }
end

return M

