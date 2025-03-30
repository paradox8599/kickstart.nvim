-- fancy diagnostic

return {
  'rachartier/tiny-inline-diagnostic.nvim',

  -- enabled = false,

  event = 'LspAttach',

  priority = 1000, -- needs to be loaded in first

  config = function()
    require 'config.tiny-inline-diagnostic'
  end,
}
