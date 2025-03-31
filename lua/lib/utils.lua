local M = {}

M.bool2str = function(bool)
  return bool and 'on' or 'off'
end

---@param name string
---@param fn_enabled fun(): boolean
---@param fn_toggle fun(is_enabled: boolean)
M.toggle = function(name, fn_enabled, fn_toggle)
  fn_toggle(fn_enabled())
  require('snacks.notify').notify(string.format('%s %s', name, M.bool2str(fn_enabled())))
end

---@param list table
---@param items table|any
M.list_insert_unique = function(list, items)
  if type(items) ~= 'table' then
    items = { items }
  end

  for _, item in ipairs(items) do
    if not vim.tbl_contains(list, item) then
      table.insert(list, item)
    end
  end
end

return M
