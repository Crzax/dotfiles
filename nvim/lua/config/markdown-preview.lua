local M = {}

function M.setup()
  -- General settings for Markdown Preview
  vim.g.mkdp_auto_start = 0 -- Do not auto start the preview
  vim.g.mkdp_auto_close = 1 -- Auto close the preview when switching buffers
  vim.g.mkdp_refresh_slow = 0 -- Refresh the preview quickly
  vim.g.mkdp_command_for_global = 0 -- Do not create global commands for the preview
  vim.g.mkdp_open_to_the_world = 0 -- Do not open the preview to the world
  vim.g.mkdp_open_ip = '' -- Default IP for preview
  vim.g.mkdp_browser = '' -- Default browser for preview
  vim.g.mkdp_echo_preview_url = 0 -- Do not echo the preview URL
  vim.g.mkdp_browserfunc = '' -- Default browser function

  -- Preview options
  vim.g.mkdp_preview_options = {
    mkit = {}, -- Markdown-it options
    katex = {}, -- KaTeX options
    uml = {}, -- UML diagrams options
    maid = {}, -- Mermaid diagrams options
    disable_sync_scroll = 0, -- Enable sync scroll
    sync_scroll_type = 'middle', -- Sync scroll type
    hide_yaml_meta = 1, -- Hide YAML metadata
    sequence_diagrams = {}, -- Sequence diagrams options
    flowchart_diagrams = {}, -- Flowchart diagrams options
    content_editable = vim.fn.has('nvim-0.5') == 1 and vim.fn.has('patch-8.1.1719') == 1, -- Check if content is editable
    disable_filename = 0, -- Do not disable filename
    toc = {} -- Table of contents options
  }

  -- Additional settings
  vim.g.mkdp_markdown_css = '' -- Custom CSS for Markdown
  vim.g.mkdp_highlight_css = '' -- Custom CSS for highlighting
  vim.g.mkdp_port = '' -- Default port for the preview server
  vim.g.mkdp_page_title = '「${name}」' -- Page title format
  vim.g.mkdp_images_path = '' -- Default path for images
  vim.g.mkdp_filetypes = { 'markdown' } -- Filetypes that trigger the preview
  vim.g.mkdp_theme = 'dark' -- Default theme for the preview
  vim.g.mkdp_combine_preview = 0 -- Do not combine preview
  vim.g.mkdp_combine_preview_auto_refresh = 1 -- Auto refresh combined preview

  -- Key mappings for Markdown Preview
  vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>MarkdownPreview", { noremap = true, silent = true }) -- Start Markdown Preview with <C-s>
  vim.api.nvim_set_keymap("n", "<M-s>", "<Plug>MarkdownPreviewStop", { noremap = true, silent = true }) -- Stop Markdown Preview with <M-s>
  vim.api.nvim_set_keymap("n", "<leader>p", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true }) -- Toggle Markdown Preview with <leader>p
end

return M

