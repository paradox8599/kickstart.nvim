local snacks = require 'snacks'
local picker = snacks.picker
local terminal = snacks.terminal

snacks.setup {
  bigfile = { notify = true, size = 1 * 1024 * 1024 },
  git = { enabled = true },
  gitbrowse = {},
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

  scope = { enabled = true },

  -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
        { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
        { icon = ' ', key = 'w', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = ' ', key = 's', desc = 'Restore Session', action = ":lua require('resession').load(vim.fn.getcwd(), { dir = 'dirsession' })" },
        { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
        { icon = ' ', key = 'm', desc = 'Mason', action = ':Mason' },
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
vim.keymap.set('n', '<leader>uD', snacks.notifier.hide, { desc = 'Dismiss Notifications' })

-- Git mappings
vim.keymap.set('n', '<leader>gf', snacks.lazygit.log_file, { desc = 'Git History (Current File)' })
vim.keymap.set('n', '<leader>gl', snacks.lazygit.log, { desc = 'Git Log' })
vim.keymap.set('n', '<leader>br', snacks.rename.rename_file, { desc = 'Rename File' })
vim.keymap.set('n', '<leader>go', snacks.gitbrowse.open, { desc = 'Git Browse' })

-- Word navigation
vim.keymap.set({ 'n', 't' }, ']]', function()
  snacks.words.jump(vim.v.count1)
end, { desc = 'Next Reference' })
vim.keymap.set({ 'n', 't' }, '[[', function()
  snacks.words.jump(-vim.v.count1)
end, { desc = 'Prev Reference' })

-- Terminal mappings
vim.keymap.set('t', '<C-i>', ':hide<cr>', { desc = 'Hide terminal' })
vim.keymap.set('n', '<leader>gg', snacks.lazygit.open, { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>td', function()
  terminal.toggle 'lazydocker'
end, { desc = 'LazyDocker' })
vim.keymap.set('n', '<leader>tw', function()
  terminal.toggle 'yazi'
end, { desc = 'Yazi' })
vim.keymap.set('n', '<leader>tb', function()
  terminal.toggle 'btm'
end, { desc = 'Btm' })
-- aider
vim.keymap.set('n', '<leader>tA', function()
  terminal.toggle('aider', { win = { position = 'right', width = 0.4 } })
end, { desc = 'Aider' })
vim.keymap.set('n', '<Leader>ta', function()
  ---@diagnostic disable-next-line: undefined-field
  local filepath = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))
  filepath = '"' .. filepath .. '"'
  terminal.toggle('aider ' .. filepath, { win = { position = 'right', width = 0.4 } })
end, { desc = 'Aider with current file' })

-- picker
vim.keymap.set('n', '<leader>f<Enter>', picker.resume, { desc = 'Resume' })
vim.keymap.set('n', '<leader>f;', picker.pickers, { desc = 'Picker Sources' })
vim.keymap.set('n', '<leader>fp', picker.projects, { desc = 'Projects' })
vim.keymap.set('n', '<leader>ff', picker.files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  picker.files { ignored = true, hidden = true }
end, { desc = 'Find All Files' })
vim.keymap.set('n', '<leader>fO', picker.recent, { desc = 'Recent Files' })
vim.keymap.set('n', '<leader>fo', function()
  picker.recent {
    filter = { cwd = true },
    title = 'Recent (cwd)',
  }
end, { desc = 'Recent Files (cwd)' })
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
