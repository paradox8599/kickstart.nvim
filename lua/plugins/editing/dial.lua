return {
  'monaqa/dial.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<C-a>',
      function()
        require('dial.map').manipulate('increment', 'normal')
      end,
      desc = 'Dial Increment',
    },
    {
      '<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'normal')
      end,
      desc = 'Dial Decrement',
    },
  },
  config = function()
    local augend = require 'dial.augend'
    require('dial.config').augends:register_group {
      default = {
        augend.constant.new { elements = { 'and', 'or' } },
        augend.constant.new { elements = { 'True', 'False' } },
        augend.constant.new { elements = { '&&', '||' }, word = false },
        augend.constant.new { elements = { '==', '!=' }, word = false },
        augend.constant.new { elements = { '===', '!==' }, word = false },

        augend.integer.alias.decimal_int,
        augend.constant.alias.bool,
        augend.integer.alias.hex,
        augend.semver.alias.semver,
        augend.date.alias['%Y/%m/%d'],
        augend.date.alias['%Y-%m-%d'],
        augend.date.alias['%d/%m/%Y'],
        augend.date.alias['%d-%m-%Y'],
      },
    }
  end,
}
