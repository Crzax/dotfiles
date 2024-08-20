-- Define common options for key mappings
local opts = {
    noremap = true,      -- Non-recursive mapping
    silent = true,       -- Do not show message in the command line
}

--------------
-- All modes --
--------------

-- Set <leader> key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.keymap.set()` for more details
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)  -- Navigate to the left window
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)  -- Navigate to the window below
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)  -- Navigate to the window above
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)  -- Navigate to the right window

-- Resize with arrow keys
-- Delta: 2 lines or columns
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)     -- Decrease window height
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)   -- Increase window height
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)  -- Decrease window width
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts) -- Increase window width

-- Set to open/close TOC quickly
vim.keymap.set('n', '<leader>s', ':VimtexTocToggle<CR>', opts)  -- Toggle NERDTree file explorer

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)  -- Indent left while maintaining selection
vim.keymap.set('v', '>', '>gv', opts)  -- Indent right while maintaining selection



