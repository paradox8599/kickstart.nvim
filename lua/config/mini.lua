-- https://github.com/echasnovski/mini.nvim

local statusline = require 'mini.statusline'
statusline.setup { use_icons = true }

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
