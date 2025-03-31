return {

  'roobert/search-replace.nvim',

  config = function()
    -- g: global
    -- c: confirm
    -- i: case insensitive
    -- I: case sensitive
    require('search-replace').setup {
      -- default_replace_single_buffer_options = "gcI",
      -- default_replace_multi_buffer_options = "egcI",
    }

    -- show the effects of a search / replace in a live preview window
    vim.o.inccommand = 'split'
  end,

  keys = {
    { mode = 'x', '<C-r>', vim.cmd.SearchReplaceSingleBufferVisualSelection, desc = 'Search & Replace: Selection' },
    { mode = 'x', '<C-s>', vim.cmd.SearchReplaceWithinVisualSelection, desc = 'Search & Replace: In Selection' },
    { mode = 'x', '<C-b>', vim.cmd.SearchReplaceWithinVisualSelectionCWord, desc = 'Search Replace: Cursor Word In Selection' },

    { mode = 'n', '<leader>so', vim.cmd.SearchReplaceSingleBufferOpen, desc = 'Search & Replace: Open' },
    { mode = 'n', '<leader>sw', vim.cmd.SearchReplaceSingleBufferCWord, desc = 'Search & Replace: Cursor Word' },
    { mode = 'n', '<leader>sW', vim.cmd.SearchReplaceSingleBufferCWORD, desc = 'Search & Replace: Cursor WORD' },
    -- { mode = 'n', '<leader>se',vim.cmd.SearchReplaceSingleBufferCExpr, desc = 'Search & Replace: Cursor Expr' },
    -- { mode = 'n', '<leader>sf',vim.cmd.SearchReplaceSingleBufferCFile, desc = 'Search & Replace: Cursor File' },
  },
}
