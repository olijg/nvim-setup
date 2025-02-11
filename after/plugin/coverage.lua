require('coverage').setup({
  commands = true,
  -- configuration options here
  highlights = {
    -- customize highlights
    covered = { fg = "#C3E88D" },
    uncovered = { fg = "#F07178" },
  },
  signs = {
    -- customize signs
    covered = { hl = "CoverageCovered", text = "▎" },
    uncovered = { hl = "CoverageUncovered", text = "▎" },
  },
  summary = {
    -- customize summary pop-up
    min_coverage = 80.0,
  },
  lang = {
    -- customize language specific settings
  }
})
