-- show counts of references, definitions, implementations, etc.

return {
  'Wansmer/symbol-usage.nvim',

  keys = {
    {
      '<leader>ux',
      function()
        require('symbol-usage').toggle()
      end,
      desc = 'Toggle symbol usage (buf)',
    },

    {
      '<leader>uX',
      function()
        require('symbol-usage').toggle_globally()
      end,
      desc = 'Toggle symbol usage (Global)',
    },
  },

  config = function()
    require 'config.symbol-usage'
  end,
}
