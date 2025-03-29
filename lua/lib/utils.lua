local M = {}

M.bool2str = function(bool)
  return bool and 'on' or 'off'
end

---@param name string
---@param fn_enabled fun(): boolean
---@param fn_toggle fun(is_enabled: boolean)
M.toggle = function(name, fn_enabled, fn_toggle)
  local is_enabled = fn_enabled()
  fn_toggle(is_enabled)
  require('snacks.notify').notify(string.format('%s %s', name, M.bool2str(not is_enabled)))
end

return M
