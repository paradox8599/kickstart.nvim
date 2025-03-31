require('overseer').setup {
  -- strategy = 'toggleterm',
  dap = false,
  task_list = {
    direction = 'bottom',
    bindings = {
      ['<C-l>'] = false,
      ['<C-h>'] = false,
      ['<C-k>'] = false,
      ['<C-j>'] = false,
      q = vim.cmd.close,
      K = 'IncreaseDetail',
      J = 'DecreaseDetail',
      ['<C-p>'] = 'ScrollOutputUp',
      ['<C-n>'] = 'ScrollOutputDown',
    },
  },
}
