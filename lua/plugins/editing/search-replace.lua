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
    { mode = 'x', '<C-r>', '<CMD>SearchReplaceSingleBufferVisualSelection<CR>', desc = 'Search & Replace: Selection' },
    { mode = 'x', '<C-s>', '<CMD>SearchReplaceWithinVisualSelection<CR>', desc = 'Search & Replace: In Selection' },
    { mode = 'x', '<C-b>', '<CMD>SearchReplaceWithinVisualSelectionCWord<CR>', desc = 'Search Replace: Cursor Word In Selection' },

    { mode = 'n', '<leader>so', '<CMD>SearchReplaceSingleBufferOpen<CR>', desc = 'Search & Replace: Open' },
    { mode = 'n', '<leader>sw', '<CMD>SearchReplaceSingleBufferCWord<CR>', desc = 'Search & Replace: Cursor Word' },
    { mode = 'n', '<leader>sW', '<CMD>SearchReplaceSingleBufferCWORD<CR>', desc = 'Search & Replace: Cursor WORD' },
    -- { mode = 'n', '<leader>se', '<CMD>SearchReplaceSingleBufferCExpr<CR>', desc = 'Search & Replace: Cursor Expr' },
    -- { mode = 'n', '<leader>sf', '<CMD>SearchReplaceSingleBufferCFile<CR>', desc = 'Search & Replace: Cursor File' },
  },
}
