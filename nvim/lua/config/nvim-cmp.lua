-- Function to check if there are words before the cursor in the current line
local has_words_before = function()
    -- Compatibility for Lua 5.1 (unpack) and Lua 5.2+ (table.unpack)
    unpack = unpack or table.unpack
    -- Get the current cursor position (line and column)
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- Check if the column is not at the start and the character before the cursor is not a whitespace
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Require the luasnip and cmp modules
local luasnip = require("luasnip")
local cmp = require("cmp")

-- Set up the nvim-cmp plugin with the following configuration
cmp.setup({
    -- Configuration for snippet expansion
    snippet = {
        -- Required - specify the snippet engine
        expand = function(args)
            -- Use luasnip to expand the snippet
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- Key mapping configuration
    mapping = cmp.mapping.preset.insert({
        -- Use <C-b> and <C-f> to scroll the documentation
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Use <C-k> and <C-j> to navigate through completion items
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- Use <CR> (Enter) to confirm the selected item
        -- Set `select` to `true` to confirm the currently selected item
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Custom mapping for <Tab> and <S-Tab> (Shift-Tab) for snippet jumping and completion
        -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- If the completion menu is visible, select the next item
            if cmp.visible() then
                cmp.select_next_item()
            -- If there are words before the cursor, trigger the completion menu
            elseif has_words_before() then
                cmp.complete()
            else
                -- Fallback to the default <Tab> behavior
                fallback()
            end
        end, { "i", "s" }), -- Modes: i - insert mode; s - select mode
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            -- If the completion menu is visible, select the previous item
            if cmp.visible() then
                cmp.select_prev_item()
            -- If a snippet jump is possible, jump to the previous snippet position
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                -- Fallback to the default <S-Tab> behavior
                fallback()
            end
        end, { "i", "s" }),
    }),

    -- Configuration for the appearance of the completion menu
    -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    formatting = {
        -- Specify the fields to be displayed in the menu
        fields = { 'abbr', 'menu' },

        -- Custom function to format the appearance of the completion items
        format = function(entry, vim_item)
            -- Set the menu text based on the source of the completion item
            vim_item.menu = ({
                nvim_lsp = '[Lsp]',
                luasnip = '[Luasnip]',
                buffer = '[File]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },
})

