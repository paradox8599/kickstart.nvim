return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  -- branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = vim.fn.executable 'make' == 1,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'echasnovski/mini.icons' },
  },
  config = function()
    require 'config.telescope'
  end,
}
