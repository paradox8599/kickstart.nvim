-- find and replace

return {
  'MagicDuck/grug-far.nvim',

  -- config = function()
  --   require("grug-far").setup {
  --     -- options, see Configuration section below
  --     -- there are no required options atm
  --     -- engine = 'ripgrep' is default, but 'astgrep' can be specified
  --   }
  -- end,

  opts = {},

  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>ss',
      function()
        require('grug-far').with_visual_selection {
          transient = true,
          prefills = {
            paths = vim.fn.expand '%',
          },
        }
      end,
      desc = 'Search and Replace: Buffer',
    },

    {
      mode = { 'n', 'x' },
      '<leader>sg',
      function()
        require('grug-far').with_visual_selection {
          transient = true,
        }
      end,
      desc = 'Search & Replace: Global',
    },

    {
      mode = 'n',
      '<leader>sc',
      function()
        require('grug-far').open {
          transient = true,
          prefills = {
            paths = vim.fn.expand '%',
            search = vim.fn.expand '<cword>',
          },
        }
      end,
      desc = 'Search & Replace: Cursor Word (Buffer)',
    },

    {
      mode = 'n',
      '<leader>sC',
      function()
        require('grug-far').open {
          transient = true,
          prefills = {
            search = vim.fn.expand '<cword>',
          },
        }
      end,
      desc = 'Search & Replace: Cursor Word (Global)',
    },
  },
}
