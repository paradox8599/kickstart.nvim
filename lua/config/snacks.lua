require('snacks').setup {
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
}
