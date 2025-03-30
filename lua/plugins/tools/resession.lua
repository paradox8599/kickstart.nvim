return {
  'stevearc/resession.nvim',

  lazy = true,

  config = function()
    require 'config.resession'
  end,

  keys = {
    {
      '<leader>SS',
      function()
        require('resession').save()
      end,
      desc = 'Save',
    },
    {
      '<leader>SD',
      function()
        require('resession').save(vim.fn.getcwd(), { dir = 'dirsession', notify = false })
      end,
      desc = 'Save dir session',
    },
    {
      '<leader>ST',
      function()
        require('resession').save_tab()
      end,
      desc = 'Save tab',
    },

    {
      '<leader>SL',
      function()
        require('resession').load 'last'
      end,
      desc = 'Load last session',
    },

    {
      '<leader>S.',
      function()
        require('resession').load(vim.fn.getcwd(), { dir = 'dirsession' })
      end,
      desc = 'Load dir session',
    },

    {
      '<leader>SF',
      function()
        require('resession').load(nil, { dir = 'dirsession' })
      end,
      desc = 'Load a dir session',
    },

    {
      '<leader>Sf',
      function()
        require('resession').list()
      end,
      desc = 'List',
    },

    {
      '<leader>SD',
      function()
        require('resession').delete()
      end,
      desc = 'Delete',
    },
  },

  opts = {
    tab_buf_filter = function(tabpage, bufnr)
      return vim.tbl_contains(vim.t[tabpage].bufs, bufnr)
    end,
  },
}
