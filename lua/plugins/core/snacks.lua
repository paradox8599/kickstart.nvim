return {
  'folke/snacks.nvim',

  dependencies = {
    -- disables duplicate plugins
    -- { 'RRethy/vim-illuminate', enabled = false, optional = true },
    -- { 'akinsho/toggleterm.nvim', enabled = false, optional = true },
  },

  priority = 1000,
  lazy = false,

  config = function()
    require 'config.snacks'
  end,

  keys = {
    {
      '<leader>gf',
      function()
        require('snacks').lazygit.log_file()
      end,
      desc = 'Git History (Current File)',
    },
    {
      '<leader>gl',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>br',
      function()
        require('snacks').rename.rename_file()
      end,
      desc = 'Rename File',
    },
    -- { "<leader>h", function() require("snacks").dashboard() end, desc = "Dashboard" },
    {
      ']]',
      function()
        require('snacks').words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        require('snacks').words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },

    -- {
    --   '<leader>.',
    --   function()
    --     require('snacks').scratch()
    --   end,
    --   desc = 'Toggle Scratch Buffer',
    -- },
    -- {
    --   '<leader>,',
    --   function()
    --     require('snacks').scratch.select()
    --   end,
    --   desc = 'Select Scratch Buffer',
    -- },

    {
      '<leader>go',
      function()
        require('snacks').gitbrowse.open()
      end,
      mode = { 'n' },
    },

    -- [[Terminals]]

    -- hide active terminal
    {
      '<C-t>',
      function()
        vim.cmd 'hide'
      end,
      mode = { 't' },
    },

    {
      '<leader>gg',
      function()
        -- require("snacks").terminal.toggle "lazygit"
        require('snacks').lazygit()
      end,
      desc = 'LazyGit',
      mode = { 'n' },
    },

    {
      '<leader>td',
      function()
        require('snacks').terminal.toggle 'lazydocker'
      end,
      desc = 'LazyDocker',
    },

    {
      '<leader>tw',
      function()
        require('snacks').terminal.toggle 'yazi'
      end,
      desc = 'Yazi',
    },

    {
      '<leader>tb',
      function()
        require('snacks').terminal.toggle 'btm'
      end,
      desc = 'Btm',
    },

    {
      '<leader>tA',
      function()
        require('snacks').terminal.toggle('aider', {
          win = { position = 'right', width = 0.4 },
        })
      end,
      desc = 'Aider',
    },

    {
      '<Leader>ta',
      function()
        ---@diagnostic disable-next-line: undefined-field
        local filepath = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))
        filepath = '"' .. filepath .. '"'
        require('snacks').terminal.toggle('aider ' .. filepath, {
          win = { position = 'right', width = 0.4 },
        })
      end,
      desc = 'Aider with current file',
    },
  },
}
