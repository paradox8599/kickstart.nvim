local rs = require 'resession'
rs.setup {
  autosave = {
    enabled = true,
    interval = 60,
    notify = false,
  },
}

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    rs.save(vim.fn.getcwd(), { dir = 'dirsession', notify = false })
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    rs.save 'last'
  end,
})
