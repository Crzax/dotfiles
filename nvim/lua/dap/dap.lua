-- Install debugpy with mason
require('mason-tool-installer').setup({
    ensure_installed = { 'debugpy', 'cpptools' },
})

-- Set up the UIs
local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        fg = '#993939',
        bg = '#31353f',
    },
    logpoing = {
        ctermbg = 0,
        fg = '#61afef',
        bg = '#31353f',
    },
    stopped = {
        ctermbg = 0,
        fg = '#98c379',
        bg = '#31353f'
    },
}

-- Set up Highlight groups
vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = '◆',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "✗",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '◆',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '▶',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

-- Set up signs
vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

-- Set up keymaps
vim.keymap.set({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.continue()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<F10>", "<cmd>lua require'dap'.step_over()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<F8>", "<cmd>lua require'dap'.step_into()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<F12>", "<cmd>lua require'dap'.step_out()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<leader>sb", "<cmd>lua require'dap'.step_back()<CR>",
    { silent = true, noremap = true, buffer = bufnr })
vim.keymap.set({ "i", "n", "v" }, "<leader>cl", "<cmd>lua require'dapui'.close()<CR>",
    { silent = true, noremap = true, buffer = bufnr })

require('dap.dapui')
require('dap.python')
require('dap.cpp')
