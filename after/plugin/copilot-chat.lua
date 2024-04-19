-- Copilot autosuggestions
vim.g.copilot_no_tab_map = true
vim.g.copilot_hide_during_completion = 0
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

local chat = require("CopilotChat")
local select = require("CopilotChat.select")


chat.setup({
    debug = false,
    show_help = 'yes',
    language = 'English',
    prompts = {
    },
    build = function ()
        vim.notify("Please update the remote plugins by running :UpdateRemotePlugins, then restart Neovim.")
    end,
    event = "VeryLazy",
})

vim.keymap.set("n", "<leader>ccc", ":CopilotChatToggle<cr>")
vim.keymap.set("x", "<leader>cco", ":CopilotChatOptimize<cr>")
vim.keymap.set("x", "<leader>ccf", ":CopilotChatFix<cr>")
vim.keymap.set("x", "<leader>cce", ":CopilotChatExplain<cr>")
vim.keymap.set("n", "<leader>cct", ":CopilotChatTests<cr>")
vim.keymap.set("x", "<leader>ccr", ":CopilotChatReview<cr>")
