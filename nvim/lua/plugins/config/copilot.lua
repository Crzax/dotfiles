local M = {}

function M.setup()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<M-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

return M
