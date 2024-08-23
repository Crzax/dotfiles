local prompts = {
    -- Code related prompts
    Explain = "请解释以下代码是如何工作的。",
    Review = "请审查以下代码并提供改进建议。",
    Tests = "请解释选中的代码是如何工作的，然后为其生成单元测试。",
    Refactor = "请重构以下代码以提高其清晰度和可读性。",
    FixCode = "请修复以下代码，使其按预期工作。",
    FixError = "请解释以下文本中的错误并提供解决方案。",
    BetterNamings = "请为以下变量和函数提供更好的命名。",
    Documentation = "请为以下代码提供文档。",
    SwaggerApiDocs = "请为以下API提供Swagger文档。",
    SwaggerJsDocs = "请为以下API编写使用Swagger的JSDoc。",
    -- Text related prompts
    Summarize = "请总结以下文本的内容。",
    Spelling = "请纠正以下文本中的语法和拼写错误。",
    Wording = "请改善以下文本的语法和措辞。",
    Concise = "请重写以下文本，使其更简洁。",
}

return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        build = "make tiktoken",          -- Only on MacOS or Linux
        opts = {
            debug = true,                 -- Enable debugging
            prompts = prompts,            -- Custom prompts
            -- See Configuration section for rest
        },
        keys = {
            { "<leader>cpc", ":CopilotChat ",              desc = "CopilotChat - Prompt" },
            { "<leader>cpe", ":CopilotChatExplain<cr>",    desc = "CopilotChat - Explain code" },
            { "<leader>cpT", ":CopilotChatToggle<cr>",     desc = "CopilotChat - Toggle chat window" },
            { "<leader>cpt", "<cmd>CopilotChatTests<cr>",  desc = "CopilotChat - Generate tests" },
            { "<leader>cpr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}
