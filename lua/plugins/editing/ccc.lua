-- color picker & visualizer

return {
  'uga-rosa/ccc.nvim',

  event = { 'BufEnter', 'InsertEnter' },

  keys = {
    { '<Leader>uC', vim.cmd.CccHighlighterToggle, desc = 'Toggle colorizer' },
    { '<Leader>zc', vim.cmd.CccConvert, desc = 'Convert color' },
    { '<Leader>zp', vim.cmd.CccPick, desc = 'Pick color' },
  },

  config = function(_, opts)
    require('ccc').setup(opts)
    vim.cmd.CccHighlighterEnable()
  end,
}
