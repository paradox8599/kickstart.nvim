vim.keymap.set('n', '<leader>ps', vim.cmd.Lazy, { desc = 'Lazy' })
vim.keymap.set('n', '<leader>pm', vim.cmd.Mason, { desc = 'Mason' })

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
    { import = 'plugins.packs' },
    { import = 'plugins.tools' },
    { import = 'plugins.ui' },
    { import = 'plugins.utils' },
  },
  ---@diagnostic disable-next-line: missing-fields
  {}
)
