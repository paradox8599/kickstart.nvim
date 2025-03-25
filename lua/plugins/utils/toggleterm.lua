return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  keys = {
    {
      '<leader>gg',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazydocker = Terminal:new {
          cmd = 'lazygit',
          dir = '.',
          direction = 'float',
          float_opts = { border = 'curved' },
        }
        lazydocker:open()
      end,
      desc = 'LazyGit',
    },

    {
      '<leader>td',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazydocker = Terminal:new {
          cmd = 'lazydocker',
          dir = '.',
          direction = 'float',
          float_opts = { border = 'curved' },
        }
        lazydocker:open()
      end,
      desc = 'LazyDocker',
    },

    {
      '<leader>tw',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local yazi = Terminal:new {
          cmd = 'yazi',
          display_name = 'yazi',
          dir = '.',
          direction = 'float',
          float_opts = { border = 'curved' },
        }
        yazi:open()
      end,
      desc = 'Yazi',
    },

    {
      '<leader>tb',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazydocker = Terminal:new {
          cmd = 'btm',
          dir = '.',
          direction = 'float',
          float_opts = { border = 'curved' },
        }
        lazydocker:open()
      end,
      desc = 'Bottom',
    },

    {
      '<leader>ta',
      function()
        require('toggleterm').setup { size = 100 }
        local Terminal = require('toggleterm.terminal').Terminal
        local aider = Terminal:new {
          cmd = 'aider',
          display_name = 'aider',
          dir = '.',
          direction = 'vertical',
        }
        aider:open()
      end,
      desc = 'Aider',
    },

    {
      '<leader>tA',
      function()
        require('toggleterm').setup { size = 100 }
        local filepath = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))
        filepath = '"' .. filepath .. '"'
        local Terminal = require('toggleterm.terminal').Terminal
        local aider = Terminal:new {
          cmd = 'aider ' .. filepath,
          display_name = 'aider',
          dir = '.',
          direction = 'vertical',
        }
        aider:open()
      end,
      desc = 'Aider: Current',
    },
  },
}
