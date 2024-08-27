-- Configure jupytext.vim
local M = {}

M.setup = function()
    -- Enable jupytext.vim
    vim.g.jupytext_enable = 1
    -- Specify the jupytext command
    vim.g.jupytext_command = 'jupytext'
    -- Set the default output format to 'py:percent'
    vim.g.jupytext_fmt = 'py:percent'
    -- Command to convert to ipynb
    vim.g.jupytext_to_ipynb_cmd = 'jupytext --to ipynb'
    -- Command to convert to py:light
    vim.g.jupytext_to_py_cmd = 'jupytext --to py:light'

    -- Automatically convert .ipynb files to .py files when opening
    vim.cmd([[
        autocmd BufRead,BufNewFile *.ipynb let g:jupytext_fmt = 'py' | JupytextOpen
    ]])
end

return M

