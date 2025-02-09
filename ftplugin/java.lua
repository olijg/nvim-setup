local root_markers = { 'gradlew', '.git', 'mvnw', 'pom.xml' }
local root_dir = vim.fs.root(0, root_markers)
local home_dir = os.getenv('HOME')
local Operating_System = {
  WIN = "Windows",
  LINUX = "Linux"
}
local detected_os
if home_dir == nil then
    home_dir = os.getenv('USERPROFILE')
    detected_os = Operating_System.WIN
else
  detected_os = Operating_System.LINUX
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local bundles = {
  vim.fn.glob( home_dir .. "/.java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),

  --   vim.fn.glob(
  --     mason_registry.get_package("java-debug-adapter"):get_install_path()
  --     .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
  --   ),
}
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(home_dir .. "/.java/vscode-java-test/server/*.jar", true),
    "\n"))

local eclipse_jar_location
local jdtls_config_location
local lombok_jar_location

if detected_os == Operating_System.LINUX then
  eclipse_jar_location = "~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
  jdtls_config_location = "~/.local/share/nvim/mason/packages/jdtls/config_linux"
  lombok_jar_location =  "/.local/lib/lombok/lombok.jar"
elseif detected_os == Operating_System.WIN then
  eclipse_jar_location = home_dir .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
  jdtls_config_location =  home_dir .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win"
  lombok_jar_location =  "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\lombok.jar"
else
  print("Could not detect OS for Java config")
end

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
    --todo!: make this more dynamic by using /.m2/repository/org/projectlombok...
    "-javaagent:" .. home_dir .. lombok_jar_location,
    "-jar",
    vim.fn.expand(
      eclipse_jar_location
    ),

    "-configuration",
    vim.fn.expand(
      jdtls_config_location
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
      signaturehelp = { enabled = true },
      import = { enabled = true },
      rename = { enabled = true },
      eclipse = {
        downloadsources = true,
      },
      maven = {
        downloadsources = true,
        updatesnapshots = true
      },
    }
  },
}

jdtls_config['on_attach'] = function(client, bufnr)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
end

require('jdtls').start_or_attach(jdtls_config)
