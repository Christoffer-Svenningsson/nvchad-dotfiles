local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require "lspconfig"

lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"cmake", "CMakeLists.txt"}
}

