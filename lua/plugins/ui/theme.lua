-- See all installed theme: `:Telescope colorscheme`

return {
  {
    'folke/tokyonight.nvim',

    priority = 1000,

    dependencies = {
      -- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    },

    config = function()
      require 'config.theme'
    end,
  },
}
