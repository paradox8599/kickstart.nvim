return {
  'mrjones2014/smart-splits.nvim',

  -- event = 'VeryLazy',

  keys = {
    {
      '<A-h>',
      function()
        require('smart-splits').resize_left()
      end,
      desc = 'Resize left',
    },
    {
      '<A-j>',
      function()
        require('smart-splits').resize_down()
      end,
      desc = 'Resize down',
    },
    {
      '<A-k>',
      function()
        require('smart-splits').resize_up()
      end,
      desc = 'Resize up',
    },
    {
      '<A-l>',
      function()
        require('smart-splits').resize_right()
      end,
      desc = 'Resize right',
    },
    {
      '<leader><leader>h',
      function()
        require('smart-splits').swap_buf_left()
      end,
      desc = 'Swap buffer left',
    },
    {
      '<leader><leader>j',
      function()
        require('smart-splits').swap_buf_down()
      end,
      desc = 'Swap buffer down',
    },
    {
      '<leader><leader>k',
      function()
        require('smart-splits').swap_buf_up()
      end,
      desc = 'Swap buffer up',
    },
    {
      '<leader><leader>l',
      function()
        require('smart-splits').swap_buf_right()
      end,
      desc = 'Swap buffer right',
    },
    {
      '<C-H>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      desc = 'Move to left split',
      mode = 'n',
    },
    {
      '<C-J>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      desc = 'Move to below split',
      mode = 'n',
    },
    {
      '<C-K>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      desc = 'Move to above split',
      mode = 'n',
    },
    {
      '<C-L>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      desc = 'Move to right split',
      mode = 'n',
    },
    {
      '<C-Up>',
      function()
        require('smart-splits').resize_up()
      end,
      desc = 'Resize split up',
      mode = 'n',
    },
    {
      '<C-Down>',
      function()
        require('smart-splits').resize_down()
      end,
      desc = 'Resize split down',
      mode = 'n',
    },
    {
      '<C-Left>',
      function()
        require('smart-splits').resize_left()
      end,
      desc = 'Resize split left',
      mode = 'n',
    },
    {
      '<C-Right>',
      function()
        require('smart-splits').resize_right()
      end,
      desc = 'Resize split right',
      mode = 'n',
    },
  },
}
