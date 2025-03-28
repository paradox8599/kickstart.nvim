return {
  'folke/snacks.nvim',

  dependencies = {
    -- disables duplicate plugins
    -- { 'RRethy/vim-illuminate', enabled = false, optional = true },
    -- { 'akinsho/toggleterm.nvim', enabled = false, optional = true },
  },

  priority = 1000,
  lazy = false,

  keys = {
    {
      '<leader>gb',
      function()
        require('snacks').git.blame_line()
      end,
      desc = 'Git blame line',
    },
    {
      '<leader>gf',
      function()
        require('snacks').lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'Lazygit Log (cwd)',
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

    {
      '<leader>.',
      function()
        require('snacks').scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>,',
      function()
        require('snacks').scratch.select()
      end,
      desc = 'Select Scratch Buffer',
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
      '<leader>ta',
      function()
        require('snacks').terminal.toggle('aider', {
          win = { position = 'right', width = 0.4 },
        })
      end,
      desc = 'Aider',
    },

    {
      '<Leader>tA',
      function()
        local filepath = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))
        filepath = '"' .. filepath .. '"'
        require('snacks').terminal.toggle('aider ' .. filepath, {
          win = { position = 'right', width = 0.4 },
        })
      end,
      desc = 'Aider with current file',
    },
  },

  opts = {
    bigfile = { notify = true, size = 1 * 1024 * 1024 },
    git = { enabled = true },
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    words = {
      enabled = true,
      debounce = 200, -- time in ms to wait before updating
      notify_jump = false, -- show a notification when jumping
      notify_end = true, -- show a notification when reaching the end
      foldopen = true, -- open folds after jumping
      jumplist = true, -- set jump point before jumping
      modes = { 'n', 'i', 'c' }, -- modes to show references
    },
    terminal = { enabled = true },
    scratch = {},

    indent = {
      enabled = true,
      animate = {
        enabled = true,
        style = 'down',
        druation = { step = 20, total = 120 },
      },
      scope = { enabled = true, underline = false },
      chunk = { enabled = false },
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 2 },
        {
          pane = 1,
          gap = 1,
          icon = ' ',
          title = ' Recent',
          section = 'recent_files',
          indent = 4,
          padding = 1,
        },
        {
          pane = 1,
          gap = 1,
          icon = ' ',
          title = ' Projects',
          section = 'projects',
          indent = 4,
          padding = 1,
        },
        { section = 'startup' },
      },
    },
  },
}
