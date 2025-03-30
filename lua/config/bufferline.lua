local bufferline = require 'bufferline'

bufferline.setup {
  options = {
    offsets = {
      {
        filetype = 'neo-tree',
        -- text = 'Files',
        -- highlight = 'Directory',
        separator = false,
      },
    },
  },
}
