require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "gemini",
    }
  },
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "AIzaSyB2M3oRWd0fd6E84ivGbnxLgxvbjEUaaao"
        },
        schema = {
          model = {
            default = "gemini-1.5-pro",
          }
        }
      })
    end,
  },
})
