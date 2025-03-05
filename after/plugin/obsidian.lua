if os.getenv("HOME") then
  NotePath = "/mnt/c/Users/olive/Documents/Notes/"
else
  NotePath = "\\Users\\olive\\Documents\\Notes\\"
end

require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = NotePath,
    },
  },
  daily_notes = {
    folder = "Daily",
    date_format = "%y%m%d",
    --- alias_format = "",
    template = "Daily Note Template Nvim.md"
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
    date_format = "%A %d %b %Y",
    time_format = "%H:%M",
    substitutions = {
    }
  },
  picker = {
    name = "snacks.pick",
  }

})
