-- Highlight, edit, and navigate code

return {
  {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    event = 'VeryLazy',

    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', lazy = true },
    },

    config = function()
      require 'config.treesitter'
    end,
  },
}
