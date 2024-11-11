local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
  -- Auto format on save
  lsp.buffer_autoformat()
end)

lsp.ensure_installed({
  'eslint',
  'rust_analyzer',
  'basedpyright'
})
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Completion Plugin Setup
local cmp = require 'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                                       -- file paths
    { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
    { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
    { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
    { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
    { name = 'calc' },                                       -- source for math calculation
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        vsnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

local root_markers = { 'gradlew', '.git', 'mvnw' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home_dir = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local bundles = {
  vim.fn.glob(
    home_dir .. ".java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),

  --   vim.fn.glob(
  --     mason_registry.get_package("java-debug-adapter"):get_install_path()
  --     .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
  --   ),
}
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(home_dir .. ".java/vscode-java-test/server/*.jar"),
    "\n"))

local jdtls_config = {

  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    --TODO!: Make this more dynamic by using /.m2/repository/org/projectlombok...
    "-javaagent:" .. home_dir .. "/.local/lib/lombok/lombok.jar",
    "-jar",
    vim.fn.expand(
      "~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
    ),

    "-configuration",
    vim.fn.expand(
      "~/.local/share/nvim/mason/packages/jdtls/config_linux"
    ),

    "-data",
    vim.fn.expand(
      "~/.cache/jdtls/workspace/"
    ) .. project_name,
  },

  root_dir = root_dir,
  init_options = {
    bundles = bundles
  },
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      import = { enabled = true },
      rename = { enabled = true },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true
      },
    }
  },
}

jdtls_config['on_attach'] = function(client, bufnr)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
end

require('lspconfig').jdtls.setup(jdtls_config)

local function get_current_filetype()
  local bufnr = vim.api.nvim_get_current_buf()
  return vim.bo[bufnr].filetype
end

if get_current_filetype() ~= 'java' then
  lsp.setup()
end
