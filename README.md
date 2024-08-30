# Dotfiles

> [*Your dotfiles will most likely be the longest project you ever work on.*](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

Using version control systems to manage my dotfiles ensures that every computer's configuration is ready to use out of the box. 

Neovim's configurations is based on windows, maybe you should modify some configurations to make it suitable for Linux.

## What is inside ?

- **Bash**
    - **General settings**
      - Append to the history file, don't overwrite it
      - Check the window size after each command and update LINES and COLUMNS

    - **History settings**
      - Don't put duplicate lines or lines starting with space in the history
      - History size: 1000
      - History file size: 2000

    - **Prompt settings**
      - Fancy prompt with color support if the terminal has the capability

    - **Terminal title**
      - If this is an xterm, set the title to user@host:dir

    - **Color support for commands**
      - Enable color support of `ls` and add handy aliases
      - Aliases:
        - `ls` with color: `ls --color=auto`
        - `ll`: `ls -alF`
        - `la`: `ls -A`
        - `l`: `ls -CF`
        - `grep` with color: `grep --color=auto`
        - `fgrep` with color: `fgrep --color=auto`
        - `egrep` with color: `egrep --color=auto`

    - **Alert for long running commands**
      - `alert`: Notify when a long-running command finishes

    - **Aliases file**
      - If `~/.bash_aliases` exists, source it

    - **Programmable completion features**
      - Enable programmable completion if available

- **Tmux**
    - **Prefix Key**
      - Remap prefix from `C-b` to `C-a`

    - **Pane Splitting**
      - Split panes horizontally with `|`
      - Split panes vertically with `-`
      - Unbind default pane splitting keys (`"` and `%`)

    - **Reload Config**
      - Bind `r` to reload the tmux configuration file

    - **Pane Navigation**
      - Switch panes using `Alt` + `Arrow` without prefix

    - **Mouse Mode**
      - Enable mouse mode (tmux 2.1 and above)

    - **Window Renaming**
      - Disable automatic renaming of windows

- **Neovim**
    - **Color Scheme**
        - [Monokai](https://github.com/tanvirtin/monokai.nvim): Uses the [tanvirtin/monokai.nvim](https://github.com/tanvirtin/monokai.nvim) plugin to provide the Monokai theme.
    - **LSP (Language Server Protocol) Support**
        - [Mason](https://github.com/williamboman/mason.nvim): Manages external tools and LSP servers with [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim).
        - [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim): Simplifies LSP server configuration with [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim).
        - [LSP Config](https://github.com/neovim/nvim-lspconfig): Configures and enables LSP servers with [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
    - **File Search**
        - [LeaderF](https://github.com/Yggdroot/LeaderF): Enables quick file/Tags search with the [LeaderF](https://github.com/Yggdroot/LeaderF) plugin (using the `<C-P>` shortcut). You should install pynvim and rg(If you want to use).
        - [ACK](https://github.com/mileszs/ack.vim): Provides advanced text search capabilities with the [mileszs/ack.vim](https://github.com/mileszs/ack.vim) plugin. You should install ACK in windows at first.
    - **File Explorer**
        - [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua): Uses the [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) plugin for directory tree browsing.
    - **Commenting**
        - [NERD Commenter](https://github.com/preservim/nerdcommenter): Automatically comments code with the [scrooloose/nerdcommenter](https://github.com/preservim/nerdcommenter) plugin.
    - **VSCode-like Pictograms**
        - [LSP Kind](https://github.com/onsails/lspkind.nvim): Provides VSCode-like pictograms for auto-completion items with the [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) plugin.
        - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): To highlight, edit, and refactor code with it. You should install tree-sitter CLI by npm(Recommended) at first.
    - **Auto-Completion**
        - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Implements auto-completion with the [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) plugin:
        - [lspkind.nvim](https://github.com/onsails/lspkind.nvim): Adds icons to completion items.
        - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): LSP source for nvim-cmp.
        - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): Buffer source for nvim-cmp.
        - [cmp-path](https://github.com/hrsh7th/cmp-path): Path source for nvim-cmp.
        - [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): Command line source for nvim-cmp.
    - **Code Snippet Engine**
        - [LuaSnip](https://github.com/L3MON4D3/LuaSnip): Provides a code snippet engine with the [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) plugin.
    - **Markdown Tools**
        - [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim): Uses the [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) plugin for Markdown preview and related operations.
        - [Markdown](https://github.com/preservim/vim-markdown): The plugin provides markdown support.
    - **Jupyter Notebook Support**
        - [Notebook Navigator](https://github.com/GCBallesteros/NotebookNavigator.nvim): Manages and runs Jupyter Notebook cells with the [GCBallesteros/NotebookNavigator.nvim](https://github.com/GCBallesteros/NotebookNavigator.nvim) plugin:
          - Dependencies include [mini.comment](https://github.com/echasnovski/mini.comment), [iron.nvim](https://github.com/echasnovski/mini.comment), and [hydra.nvim](https://github.com/anuvyklack/hydra.nvim).
          - Provides keybindings for cell operations
        - [mini.hipatterns](https://github.com/echasnovski/mini.hipatterns): Provides additional syntax highlighting patterns.
    - **REPL Integration**
        - [Iron.nvim](https://github.com/Vigemus/iron.nvim): Provides REPL support for various programming languages with the [Vigemus/iron.nvim](https://github.com/Vigemus/iron.nvim) plugin.
    - **Jupyter Notebook Conversion**
        - [Jupytext](https://github.com/GCBallesteros/jupytext.nvim): Converts between `.ipynb` and `.py` files with the [goerz/jupytext.vim](https://github.com/GCBallesteros/jupytext.nvim) plugin. You should install jupytext(python-packet).
    - **Latex**
        - [vimtex](https://github.com/lervag/vimtex): You should install SumatraPDF in windows,neovim-remote(python-packet) and config them. 
    - **Copilot**
        - [copilot.vim](https://github.com/github/copilot.vim): Provide Copilot service.
        - [CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim): Chat with Copilot.
        - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): Useful Lua functions used by lots of Neovim plugins.
    - **Dap**
        - [nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol for Neovim.
        - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui): Debug Adapter Protocol UI for Neovim.
        - [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text): Debug Adapter Protocol virtual text for Neovim.
        - [Mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim): Install debug adapter protocol tools with Mason.
        - [nvim-nio](https://github.com/niobium/nvim-nio): A powerful Neovim plugin for asynchronous I/O operations.
    - **UI**
        - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Icons for neovim plugins.
        - [nvim-bufferline.lua](https://github.com/girishji/bufline.vim): Bufferline for neovim.
        - [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim): I use the evil theme to show the statusline.
        - [nvim-dashboard](https://github.com/nvimdev/dashboard-nvim): Set up my own dashboard.
    - **Terminal**
        - [Toggleterm](https://github.com/akinsho/toggleterm.nvim): Quickly open a terminal with it.
