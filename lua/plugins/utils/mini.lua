-- Collection of various small independent plugins/modules

return {
  'echasnovski/mini.icons',

  lazy = true,

  dependencies = {
    'echasnovski/mini.statusline',
  },

  config = function()
    require 'config.mini'
  end,
}
