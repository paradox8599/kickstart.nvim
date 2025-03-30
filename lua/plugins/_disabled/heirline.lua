return {
  'rebelot/heirline.nvim',

  event = 'UIEnter',

  dependencies = { 'Zeioth/heirline-components.nvim' },

  config = function()
    require 'config.heirline'
  end,
}
