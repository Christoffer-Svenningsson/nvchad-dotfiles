local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.pyright.setup {
  on_attach = on_attach,
  --capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    pyright = {
      autoImportCompletion = true,
      typeCheckingMode = 'off',
      --reportMissingTypeStubs = false,
    },
    python = {
      analysis = {
        autoSearchPaths = false,
        diagnosticMode = 'openFilesOnly',--'openilesOnly',
        useLibraryCodeForTypes = false,
        typeCheckingMode = 'off',
        --reportMissingTypeStubs = false
      }
    }
  },
  root_dir = lspconfig.util.root_pattern(
    'pyrightconfig.json'
    -- 'pyproject.toml',
    -- 'setup.py',
    -- 'setup.cfg',
    --'requirements.txt',
    -- 'Pipfile'
  )
}

