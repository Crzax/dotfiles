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

    -- Auto commenter based on language
    'scrooloose/nerdcommenter',

    -- Debugger
    'mfussenegger/nvim-dap',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    ------------
    -- Medium --
    ------------
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins.config.nvim-tree")
        end,
    },

    -- ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        config = function()
            require('plugins.config.toggleterm')
        end
    },

    -- Dashboard
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('plugins.config.dashboard')
        end,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'Yggdroot/LeaderF',
        }
    },

    -- LeaderF
    {
        'Yggdroot/LeaderF',
        event = 'VeryLazy',
        config = function()
            require('plugins.config.leaderf').setup()
        end,
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        event = 'BufRead',
        config = function()
            require('plugins.config.bufferline')
        end,
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    -- Statusline
    {
        'hoob3rt/lualine.nvim',
        config = function()
            require('plugins.config.lualine').setup()
        end,
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("plugins.config.nvim-treesitter").setup()
        end,
    },

    -- Debugger virtual text
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            'nvim-treesitter/nvim-treesitter',
        },
    },

    -- Debugger UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            'nvim-neotest/nvim-nio',
        },
    },

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
            require("plugins.config.nvim-cmp")
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
            require("plugins.config.markdown-preview").setup()
        end,
        ft = { "markdown" },
    },

    -- Markdown support
    { "preservim/vim-markdown", ft = { "markdown" } },

    -- REPL configuration
    {
        "Vigemus/iron.nvim",
        event = "BufRead",
        config = function()
            require('plugins.config.iron')
        end,
    },

    -- Convert .ipynb to .py using jupytext
    {
        'goerz/jupytext.vim',
        config = function()
            require('plugins.config.jupytext').setup()
        end,
    },

    -- Latex support
    {
        'lervag/vimtex',
        config = function()
            require('plugins.config.vimtex').setup()
        end,
    },

    -- Copilot AI
    {
        'github/copilot.vim',
        config = function()
            require('plugins.config.copilot').setup()
        end,
    },

    ----------------
    --  Advanced  --
    ----------------

    -- Copilot Chat
    require('plugins.CopilotChat'),

    -- Run Python as Jupyter Notebook
    require('plugins.NotebookNavigator'),

})
