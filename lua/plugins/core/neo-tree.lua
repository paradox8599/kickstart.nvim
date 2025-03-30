return {
  'nvim-neo-tree/neo-tree.nvim',

  -- event = 'VeryLazy',

  keys = { '<leader>e', '<leader>o' },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    -- 'nvim-tree/nvim-web-devicons', -- using mini.icon
  },

  cmd = 'Neotree',

  config = function()
    require 'config.neo-tree'
  end,
}
