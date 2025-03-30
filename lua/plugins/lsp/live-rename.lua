return {
  'saecki/live-rename.nvim',

  keys = {
    {
      '<leader>lr',
      function()
        require('live-rename').rename { insert = true }
      end,
      desc = 'Rename current symbol',
    },
  },

  opts = {},
}
