-- Setup Mason, a package manager for Neovim that helps manage external editor tooling such as LSP servers, DAP servers, linters, and formatters.
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓", -- Icon to display for installed packages
            package_pending = "➜", -- Icon to display for packages that are being installed
            package_uninstalled = "✗" -- Icon to display for packages that are not installed
        }
    }
})

-- Setup Mason LSPconfig, which integrates Mason with Neovim's built-in LSP client configuration.
require('mason-lspconfig').setup({
    -- A list of LSP servers to automatically install if they're not already installed.
    ensure_installed = { 'pylsp', 'lua_ls', 'texlab', 'clangd' },
})

-- Set different settings for different languages' LSP
-- Reference: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use `setup({})`: https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - The settings table is sent to the LSP server.
--     - `on_attach`: A Lua callback function to run after the LSP attaches to a given buffer.
local lspconfig = require('lspconfig')

-- Customized on_attach function
-- This function will be called when an LSP server attaches to a buffer, allowing us to set up key mappings and other buffer-local settings.
-- Documentation: `:help vim.diagnostic.*` for more information on the diagnostic functions used below.
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts) -- Show diagnostics in a floating window
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)        -- Jump to the previous diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)        -- Jump to the next diagnostic
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts) -- Add buffer diagnostics to the location list

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <C-x><C-o>.
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)                    -- Go to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)                     -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)                           -- Hover to show information
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)                 -- Go to implementation
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)              -- Show signature help
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)    -- Add workspace folder
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts) -- Remove workspace folder
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))                   -- List workspace folders
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)          -- Go to type definition
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)                  -- Rename symbol
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)             -- Show code actions
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)                     -- List all references
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })                                       -- Format the current buffer
    end, bufopts)
end

-- Configure each language LSP
-- Instruction to add LSP for a specific language:
-- 1. Use `:Mason` to install the corresponding LSP server.
-- 2. Add the configuration below.

-- Python LSP Server
lspconfig.pylsp.setup({
    on_attach = on_attach,
})

-- LaTeX LSP Server
lspconfig.texlab.setup({
    on_attach = on_attach,
})

-- Lua LSP Server
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- C/C++ LSP Server
lspconfig.clangd.setup({
    on_attach = on_attach,
})
