vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('java').setup({})
require('mason').setup({})
local capabilities = require('blink.cmp').get_lsp_capabilities()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'rust_analyzer',
    'basedpyright',
    'ts_ls',
    'julials',
    'jdtls',
    'html',
    'dockerls'
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({ capabilities = capabilities })
    end,
    basedpyright = function()
      require('lspconfig').basedpyright.setup({ capabilities = capabilities })
    end,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' } -- Recognize 'vim' as a global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
              checkThirdParty = false
            }
          }
        },
        capabilities = capabilities
      })
    end,
    jdtls = function()
      local java_path
      if os.getenv("HOME") then
        java_path = "/usr/lib/jvm/java-21-openjdk-amd64/bin/java"
      else
        java_path = "\\Program Files\\Java\\jdk-23\\bin\\java.exe"
      end
      require('lspconfig').jdtls.setup({
        capabilities = capabilities,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-21",
                  path = java_path,
                  default = true,
                }
              }
            }
          }
        },
        root_markers = {
          'settings.gradle',
          'settings.gradle.kts',
          'pom.xml',
          'build.gradle',
          'mvnw',
          'gradlew',
          'build.gradle',
          'build.gradle.kts'
        },
      })
    end
  },
  automatic_installation = false
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',

    },
  },
})
