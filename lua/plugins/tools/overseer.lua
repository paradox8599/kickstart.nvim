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
    { '<leader>mt', '<Cmd>OverseerToggle<CR>', desc = 'Toggle Overseer' },
    { '<leader>mc', '<Cmd>OverseerRunCmd<CR>', desc = 'Run Command' },
    { '<leader>mr', '<Cmd>OverseerRun<CR>', desc = 'Run Task' },
    { '<leader>mq', '<Cmd>OverseerQuickAction<CR>', desc = 'Quick Action' },
    { '<leader>ma', '<Cmd>OverseerTaskAction<CR>', desc = 'Task Action' },
    { '<leader>mi', '<Cmd>OverseerInfo<CR>', desc = 'Overseer Info' },
  },

  config = function()
    require 'config.overseer'
  end,

  specs = {
    { 'catppuccin', optional = true, opts = { integrations = { overseer = true } } },
  },
}
