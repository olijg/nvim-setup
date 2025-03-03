require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "/mnt/c/Users/olive/Documents/Notes/",
    },
  },
  daily_notes = {
    folder = "Daily",
    date_format = "%y%m%d",
    --- alias_format = "",
    template = "Daily Note Template.md"
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  ui = {
    enable = true,
  },
  mappings = {
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },
  templates = {
    folder = "99-templates",
  },
  picker = {
    name = "snacks.pick",
  }

})
