local obsidian_vault = "/mnt/c/Users/olive/Documents/Notes/"
require("obsidian").setup(

  {
    workspaces = {
      {
        name = "main",
        path = obsidian_vault,
      }
    },
    daily_notes = {
      folder = "Daily",
      date_format = "%y%m%d",
      template = 'Daily Note Template.md'
    },
    templates = {
      folder = "99-templates",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix(".md")
    end,
  }
)
