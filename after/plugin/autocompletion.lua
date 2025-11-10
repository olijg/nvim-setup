local blink = require('blink.cmp')

--@module 'blink.cmp'
--@type blink.cmp.Config
local opts = {
  keymap = {
    preset = 'super-tab',
    ['<C-k>'] = false,
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'buffer'
    },
    providers = {
      cmdline = {
        enabled = function ()
          --- Prevent hang on shell input
          return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
        end
      }
    }
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}


blink.setup(opts)
