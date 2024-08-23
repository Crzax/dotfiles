-- Hint: use `:h <option>` to figure out the meaning if needed

-- Use system clipboard for copy and paste
vim.opt.clipboard = 'unnamedplus' 

-- Configure completion options
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Allow the mouse to be used in Neovim
vim.opt.mouse = 'a' 

-- Tab-related settings
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces, useful for Python

-- UI configuration
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight the screen line of the cursor
vim.opt.splitbelow = true -- Force all horizontal splits to go below the current window
vim.opt.splitright = true -- Force all vertical splits to go to the right of the current window
-- vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- Don't display mode message (e.g., -- INSERT --)

-- Searching settings
vim.opt.incsearch = true -- Show match while typing
vim.opt.hlsearch = false -- Do not highlight matches after search
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' if search pattern contains uppercase letters

-- Proxy
vim.env.http_proxy = 'http://127.0.0.1:10809'
vim.env.https_proxy = 'http://127.0.0.1:10809'


