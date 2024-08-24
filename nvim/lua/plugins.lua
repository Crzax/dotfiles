-- Define the lazy.nvim installation path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed, if not, clone it from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- Use the latest stable release
        lazypath,
    })
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with plugins
require("lazy").setup({

    ------------
    --  Easy  --
    ------------

    -- Monokai color scheme
    "tanvirtin/monokai.nvim",

    -- LSP manager and configuration
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- <C-P> search file
    'ctrlpvim/ctrlp.vim',

    -- Auto commenter based on language
    'scrooloose/nerdcommenter',

    ------------
    -- Medium --
    ------------

    -- ACK search
    {
        'mileszs/ack.vim',
        event = "VeryLazy",
    },

    -- VSCode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },

    -- Directory tree explorer
    {
        'preservim/nerdtree',
        event = "VeryLazy",
        config = function()
            -- Set to open NERDTree quickly
            vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
        end,
    },

    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",         -- Pictograms for completion items
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",   -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path",     -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline",  -- Cmdline source for nvim-cmp
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },

    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            require("config.markdown-preview").setup()
        end,
        ft = { "markdown" },
    },

    -- Markdown support
    { "preservim/vim-markdown", ft = { "markdown" } },

    -- REPL configuration
    {
        "Vigemus/iron.nvim",
        config = function()
            require('config.iron')
        end,
    },

    -- Convert .ipynb to .py using jupytext
    {
        'goerz/jupytext.vim',
        config = function()
            require('config.jupytext').setup()
        end,
    },

    -- Latex support
    {
        'lervag/vimtex',
        config = function()
            require('config.vimtex').setup()
        end,
    },

    -- Copilot AI
    {
        'github/copilot.vim',
        config = function()
            require('config.copilot').setup()
        end,
    },

    ----------------
    --  Advanced  --
    ----------------

    -- Copilot Chat
    require('extras.CopilotChat'),

    -- Run Python as Jupyter Notebook
    require('extras.NotebookNavigator'),

})
