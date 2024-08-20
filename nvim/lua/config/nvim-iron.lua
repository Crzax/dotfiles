-- Require the iron.core module, which is the core component of the Iron REPL plugin
local iron = require("iron.core")

-- Set up the Iron plugin with the following configuration
iron.setup({
  config = {
    -- Enable scratch REPLs, which are temporary REPL sessions not tied to a specific file
    scratch_repl = true,
    -- Define REPL configurations for various programming languages
    repl_definition = {
      -- Configuration for the Python REPL
      python = {
        -- Use 'ipython' as the command to start the REPL
        command = { "ipython" },
        -- Use iron's bracketed_paste format function to handle multi-line input
        format = require("iron.fts.common").bracketed_paste,
      },
    },
    -- Command to open the REPL in a vertical split, sized to 60 columns, positioned at the bottom right
    repl_open_cmd = "vertical botright 60 split",
  },
})

