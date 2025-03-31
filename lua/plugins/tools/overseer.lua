-- task runner

return {
  'stevearc/overseer.nvim',

  cmd = {
    'OverseerOpen',
    'OverseerClose',
    'OverseerToggle',
    'OverseerSaveBundle',
    'OverseerLoadBundle',
    'OverseerDeleteBundle',
    'OverseerRunCmd',
    'OverseerRun',
    'OverseerInfo',
    'OverseerBuild',
    'OverseerQuickAction',
    'OverseerTaskAction ',
    'OverseerClearCache',
  },

  keys = {
    { '<leader>m', desc = ' Overseer' },
    { '<leader>mt', vim.cmd.OverseerToggle, desc = 'Toggle Overseer' },
    { '<leader>mc', vim.cmd.OverseerRunCmd, desc = 'Run Command' },
    { '<leader>mr', vim.cmd.OverseerRun, desc = 'Run Task' },
    { '<leader>mq', vim.cmd.OverseerQuickAction, desc = 'Quick Action' },
    { '<leader>ma', vim.cmd.OverseerTaskAction, desc = 'Task Action' },
    { '<leader>mi', vim.cmd.OverseerInfo, desc = 'Overseer Info' },
  },

  config = function()
    require 'config.overseer'
  end,

  specs = {
    { 'catppuccin', optional = true, opts = { integrations = { overseer = true } } },
  },
}
