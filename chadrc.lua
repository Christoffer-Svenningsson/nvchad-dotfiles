---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'tokyonight',
  transparency = true,
  tabufline = {
    enabled = false
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"


return M
