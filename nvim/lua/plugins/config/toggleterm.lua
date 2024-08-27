-- Open
require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    start_in_insert = true,
    direction = 'horizontal',
})

-- Keymaps
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>l", "<Cmd> wincmd l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>h", "<Cmd> wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>j", "<Cmd> wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>k", "<Cmd> wincmd k<CR>", { noremap = true, silent = true })

-- Python Terminal
local Terminal = require('toggleterm.terminal').Terminal
local pyterm   = Terminal:new({
    cmd = 'python',
    direction = 'horizontal'
})

function python_toggle()
    pyterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>py", "<Cmd>lua python_toggle()<CR>", { noremap = true, silent = true })
