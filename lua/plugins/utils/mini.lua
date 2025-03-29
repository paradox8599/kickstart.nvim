-- Collection of various small independent plugins/modules

return {
  'echasnovski/mini.icons',

  dependencies = {
    'echasnovski/mini.statusline',
  },

  config = function()
    require 'config.mini'
  end,
}
