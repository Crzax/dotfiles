local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command =
    'C:\\Users\\CmyCz\\AppData\\Local\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd',
    options = {
        detached = false
    }
}


dap.configurations.cpp = {
  {
    name = "Launch by cppdbg",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\'.. vim.fn.expand('%:r') .. '.exe')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = 'D:\\Developer\\MinGW\\mingw64\\bin\\gdb.exe',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
