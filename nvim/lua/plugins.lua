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
  -- Monokai color scheme
  "tanvirtin/monokai.nvim",

  -- LSP manager and configuration
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- <C-P> search file
  'ctrlpvim/ctrlp.vim',

  -- ACK search
  'mileszs/ack.vim',

  -- Auto commenter based on language
  'scrooloose/nerdcommenter',

  -- VSCode-like pictograms
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },

  -- Directory tree explorer
  {
    'preservim/nerdtree',
    config = function()
      -- Set to open NERDTree quickly
      vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },

  -- Auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",               -- Pictograms for completion items
      "hrsh7th/cmp-nvim-lsp",       -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",         -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",           -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline",        -- Cmdline source for nvim-cmp
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
      require("config.nvim-markdown").setup()
    end,
    ft = { "markdown" },
  },

  -- Markdown support
  { "preservim/vim-markdown", ft = { "markdown" } },

  -- Run Python as Jupyter Notebook
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
      "echasnovski/mini.comment",       -- Commenting utility
      "Vigemus/iron.nvim",              -- REPL provider
      -- "akinsho/toggleterm.nvim",      -- Alternative REPL provider
      -- "benlubas/molten-nvim",         -- Alternative REPL provider
      "anuvyklack/hydra.nvim",          -- Keybinding hydra
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },

  -- REPL configuration
  {
    "Vigemus/iron.nvim",
    config = function()
      require('config.nvim-iron')
    end,
  },

  -- Convert .ipynb to .py using jupytext
  {
    'goerz/jupytext.vim',
    config = function()
      require('config.nvim-jupytext').setup()
    end,
  },

  -- Latex support
  {
    'lervag/vimtex',
    config = function()
      require('config.nvim-vimtex').setup()
    end,
  },
})
