-- Define the colorscheme to be used
local colorscheme = 'monokai_pro'

-- Attempt to set the colorscheme
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    -- Notify the user if the colorscheme is not found
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end

