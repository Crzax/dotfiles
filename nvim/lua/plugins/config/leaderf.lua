local M = {}

M.setup = function()
    -- Configure leaderf shortcut key to Ctrl+P
    vim.g.Lf_ShortcutF = '<c-p>'

    -- Set working directory mode
    vim.g.Lf_WorkingDirectoryMode = 'AF'

    -- Set root markers
    vim.g.Lf_RootMarkers = { '.git', '.svn', '.hg', '.project', '.root' }

    -- Use version control tool (default value, can be omitted)
    vim.g.Lf_UseVersionControlTool = 1

    -- Set default external search tool
    vim.g.Lf_DefaultExternalTool = 'rg'

    -- Autocommand to ignore specific file types
    vim.api.nvim_exec([[
        autocmd BufNewFile,BufRead X:/yourdir* let g:Lf_WildIgnore = {'file': ['*.vcproj', '*.vcxproj'], 'dir': []}
    ]], false)

    -- Get cache and config directories
    local cachedir = vim.fn.stdpath('cache')
    local configdir = vim.fn.stdpath('config')

    -- If not using Neovim, execute the following code (assuming you don't need this part as you are using Neovim)
    -- if not vim.fn.has('nvim') then
    --     if vim.fn.has('win32') then
    --         cachedir = '~/AppData/Local/Temp/cache/nvim'
    --         configdir = '~/AppData/Local/nvim'
    --     else
    --         cachedir = '~/.cache/nvim'
    --         configdir = '~/.config/nvim'
    --     end
    -- end

    -- Preview search results in a popup window
    vim.g.Lf_PreviewInPopup = 1

    -- Set window height
    vim.g.Lf_WindowHeight = 0.30

    -- Set cache directory
    vim.g.Lf_CacheDirectory = cachedir

    -- Set status line color scheme
    vim.g.Lf_StlColorscheme = 'powerline'

    -- Set preview result configuration
    vim.g.Lf_PreviewResult = {
        File = 0,        -- Preview for file search results (disabled)
        Buffer = 0,      -- Preview for buffer search results (disabled)
        Mru = 0,         -- Preview for most recently used files (disabled)
        Tag = 0,         -- Preview for tag search results (disabled)
        BufTag = 1,      -- Preview for buffer tag search results (enabled)
        Function = 1,    -- Preview for function search results (enabled)
        Line = 1,        -- Preview for line search results (enabled)
        Colorscheme = 0, -- Preview for colorscheme search results (disabled)
        Rg = 0,          -- Preview for rg (ripgrep) search results (disabled)
        Gtags = 0        -- Preview for gtags (GNU Global Tags) search results (disabled)
    }

    -- Map Ctrl+P to LeaderF file search
    vim.api.nvim_set_keymap('n', '<C-p>', ':Leaderf file<CR>', { noremap = true, silent = true })

    -- Rg (ripgrep) mappings
    -- Normal mode mappings
    vim.api.nvim_set_keymap('n', '<leader>fr', '<Plug>LeaderfRgPrompt', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fra', '<Plug>LeaderfRgCwordLiteralNoBoundary',
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>frb', '<Plug>LeaderfRgCwordLiteralBoundary', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>frc', '<Plug>LeaderfRgCwordRegexNoBoundary', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>frd', '<Plug>LeaderfRgCwordRegexBoundary', { noremap = true, silent = true })

    -- Visual mode mappings
    vim.api.nvim_set_keymap('v', '<leader>fra', '<Plug>LeaderfRgVisualLiteralNoBoundary',
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>frb', '<Plug>LeaderfRgVisualLiteralBoundary', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>frc', '<Plug>LeaderfRgVisualRegexNoBoundary', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>frd', '<Plug>LeaderfRgVisualRegexBoundary', { noremap = true, silent = true })
end


return M
