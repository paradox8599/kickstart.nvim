local snacks = require 'snacks'
local picker = snacks.picker

snacks.setup {
  bigfile = { notify = true, size = 1 * 1024 * 1024 },
  git = { enabled = true },
  lazygit = { enabled = true },
  quickfile = { enabled = true },
  picker = { ui_select = true },
  terminal = { enabled = true },
  scratch = {},

  notifier = { enabled = true, timeout = 3000 },

  words = {
    enabled = true,
    debounce = 200, -- time in ms to wait before updating
    notify_jump = false, -- show a notification when jumping
    notify_end = true, -- show a notification when reaching the end
    foldopen = true, -- open folds after jumping
    jumplist = true, -- set jump point before jumping
    modes = { 'n', 'i', 'c' }, -- modes to show references
  },

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

-- toggler
vim.keymap.set('n', '<leader>uD', snacks.notifier.hide, { desc = 'Dismiss notifications' })

-- picker
vim.keymap.set('n', '<leader>f<Enter>', picker.resume, { desc = 'Resume' })
vim.keymap.set('n', '<leader>f;', picker.pickers, { desc = 'Picker Sources' })
vim.keymap.set('n', '<leader>fp', picker.projects, { desc = 'Projects' })
vim.keymap.set('n', '<leader>ff', picker.files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  picker.files { ignored = true, hidden = true }
end, { desc = 'Find All Files' })
vim.keymap.set('n', '<leader>fg', picker.git_files, { desc = 'Git Files' })
vim.keymap.set('n', '<leader>fc', picker.grep_word, { desc = 'Current Word' })
vim.keymap.set('n', '<leader>fb', picker.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fd', picker.diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fd', picker.diagnostics_buffer, { desc = 'Buffer Diagnostics' })
vim.keymap.set('n', '<leader>fn', picker.notifications, { desc = 'Notifications History' })
vim.keymap.set('n', '<leader>f:', picker.command_history, { desc = 'Command History' })
vim.keymap.set('n', '<leader>fk', picker.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fh', picker.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>f/', picker.search_history, { desc = 'Search History' })
vim.keymap.set('n', "<leader>f'", picker.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>fC', picker.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fj', picker.jumps, { desc = 'Jumps' })
vim.keymap.set('n', '<leader>fi', picker.icons, { desc = 'Icons' })
vim.keymap.set('n', '<leader>fm', picker.marks, { desc = 'Marks' })
vim.keymap.set('n', '<leader>fu', picker.undo, { desc = 'Undo History' })
vim.keymap.set('n', '<leader>fT', picker.colorschemes, { desc = 'Theme' })

vim.keymap.set('n', '<leader>fw', picker.grep, { desc = 'Grep Words' })
vim.keymap.set('n', '<leader>fW', function()
  picker.grep { ignored = true, hidden = true }
end, { desc = 'Grep All Words' })
