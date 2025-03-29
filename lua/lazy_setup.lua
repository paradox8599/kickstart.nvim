vim.keymap.set('n', '<leader>ps', '<cmd>Lazy<cr>', { desc = 'Lazy' })
vim.keymap.set('n', '<leader>pm', '<cmd>Mason<cr>', { desc = 'Mason' })

require('lazy').setup(
  {
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    -- require 'kickstart.plugins.autopairs',
    -- require 'kickstart.plugins.neo-tree',
    -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

    { import = 'plugins.core' },
    { import = 'plugins.editing' },
    { import = 'plugins.git' },
    { import = 'plugins.lsp' },
    { import = 'plugins.ui' },
    { import = 'plugins.utils' },
  },
  ---@diagnostic disable-next-line: missing-fields
  {}
)
