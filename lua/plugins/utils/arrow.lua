-- bookmark files and lines

return {
  'otavioschwanck/arrow.nvim',
  dependencies = {
    -- "nvim-tree/nvim-web-devicons",
    'echasnovski/mini.icons',
  },
  opts = {
    show_icons = true,
    leader_key = ';', -- Recommended to be a single key
    buffer_leader_key = ',', -- Per Buffer Mappings
  },
}
