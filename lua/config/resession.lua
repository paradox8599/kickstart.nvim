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
    rs.save 'last'
    rs.save(vim.fn.getcwd(), { dir = 'dirsession', notify = false })
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Only load the session if nvim was started with no args and without reading from stdin
    if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
      -- Save these to a different directory, so our manual sessions don't get polluted
      rs.load(vim.fn.getcwd(), { dir = 'dirsession', silence_errors = true })
    end
  end,
  nested = true,
})
vim.api.nvim_create_autocmd('StdinReadPre', {
  callback = function()
    -- Store this for later
    vim.g.using_stdin = true
  end,
})
