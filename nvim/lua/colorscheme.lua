-- Define the colorscheme to be used
local colorscheme = 'monokai_pro'

-- Attempt to set the colorscheme
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    -- Notify the user if the colorscheme is not found
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end

-- Set the background to transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })

