vim.g.dap_virtual_text = true
vim.wo.relativenumber = true

--vim.g.loaded_python3_provider = nil
--vim.g.python3_host_prog = "/usr/bin/python3"

local enable_providers = {
  'python3_provider'
}


for _, plugin in pairs(enable_providers) do
--      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
end

--}
