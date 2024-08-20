local M = {}

M.setup = function()
    vim.g.tex_flavor = 'latex'

    vim.g.vimtex_quickfix_mode = 0

    vim.g.vimtex_view_method = 'general'
    
    vim.g.vimtex_view_general_viewer = 'D:\\ruanjian\\SumatraPDF\\SumatraPDF.exe'

    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

    vim.api.nvim_set_keymap('n', '<leader>s', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
    
    vim.g.vimtex_toc_config = {
        name = 'TOC',
        layers = {'content', 'todo', 'include'},
        split_width = 25,
        todo_sorted = 0,
        show_help = 1,
        show_numbers = 1,
    }
end

return M
