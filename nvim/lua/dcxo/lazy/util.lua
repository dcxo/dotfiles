local M = {}

local Util = require("lazy.core.util")
local Spec = require("lazy.core.plugin").Spec

---
--
--- @param spec string
--- @param config boolean|table?
--- @return table specs a table with lazy specs
function M.add_dep(spec, config)
  local doConfig = false
  local isColorscheme = false
  if type(config) == "boolean" then
    doConfig = config
  elseif type(config) == "table" then
    doConfig = config.config or false
    isColorscheme = config.isColorscheme or false
  end
  local name = Spec.get_name(spec)
  local name = Util.normname(name)
  local status, other_args = pcall(require, "dcxo.plugins." .. name)
  if status then
    local tbl = vim.tbl_extend("error", { spec }, other_args)
    return tbl
  else
    return { spec, config = doConfig, lazy = not isColorscheme, priority = isColorscheme and 1000 or 50 }
  end
end

return M
