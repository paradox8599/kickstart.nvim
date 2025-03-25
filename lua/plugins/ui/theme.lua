-- See all installed theme: `:Telescope colorscheme`

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    vim.keymap.set('n', '<leader>fT', '<cmd>Telescope colorscheme<cr>', { desc = '[F]ind [T]heme' })

    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
