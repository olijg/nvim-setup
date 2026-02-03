-- Change this path to your respective java home p5th
vim.uv.os_setenv("JAVA_HOME", "/usr/lib/jvm/java-25-openjdk-arm64")

vim.keymap.set("n", "<leader>jt", function()
  vim.cmd("JavaTestRunCurrentClass")
end)
vim.keymap.set("n", "<leader>dt", function()
  vim.cmd("JavaTestDebugCurrentClass")
end)
vim.keymap.set("n", "<leader>jr", function()
  vim.cmd("JavaTestViewLastReport")
end)
