return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  event = 'BufEnter',
  main = 'rainbow-delimiters.setup',
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    -- Modern dark theme colors for rainbow-delimiters.nvim
    vim.api.nvim_set_hl(0, 'RD_1', { fg = '#A3BE8C' }) -- Soft green
    vim.api.nvim_set_hl(0, 'RD_2', { fg = '#88C0D0' }) -- Calm blue
    vim.api.nvim_set_hl(0, 'RD_3', { fg = '#EBCB8B' }) -- Warm yellow
    vim.api.nvim_set_hl(0, 'RD_4', { fg = '#B48EAD' }) -- Muted purple
    vim.api.nvim_set_hl(0, 'RD_5', { fg = '#D08770' }) -- Soft orange
    vim.api.nvim_set_hl(0, 'RD_6', { fg = '#81A1C1' }) -- Steel blue
    vim.api.nvim_set_hl(0, 'RD_7', { fg = '#BF616A' }) -- Subdued red

    -- Jewel tone palette
    vim.api.nvim_set_hl(0, 'RD_1', { fg = '#26A69A' }) -- Teal
    vim.api.nvim_set_hl(0, 'RD_2', { fg = '#7986CB' }) -- Indigo
    vim.api.nvim_set_hl(0, 'RD_3', { fg = '#FFB74D' }) -- Amber
    vim.api.nvim_set_hl(0, 'RD_4', { fg = '#9575CD' }) -- Purple
    vim.api.nvim_set_hl(0, 'RD_5', { fg = '#4FC3F7' }) -- Light blue
    vim.api.nvim_set_hl(0, 'RD_6', { fg = '#AED581' }) -- Light green
    vim.api.nvim_set_hl(0, 'RD_7', { fg = '#FF8A65' }) -- Deep orange

    -- Pastel Theme
    -- vim.api.nvim_set_hl(0, 'RD_1', { fg = '#FFB3BA' }) -- Light Pink
    -- vim.api.nvim_set_hl(0, 'RD_2', { fg = '#BAFFC9' }) -- Light Green
    -- vim.api.nvim_set_hl(0, 'RD_3', { fg = '#BAE1FF' }) -- Light Blue
    -- vim.api.nvim_set_hl(0, 'RD_4', { fg = '#FFFFBA' }) -- Light Yellow
    -- vim.api.nvim_set_hl(0, 'RD_5', { fg = '#FFDFBA' }) -- Light Peach
    -- vim.api.nvim_set_hl(0, 'RD_6', { fg = '#E0BBE4' }) -- Light Purple
    -- vim.api.nvim_set_hl(0, 'RD_7', { fg = '#D4F0F0' }) -- Light Cyan

    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RD_1',
        'RD_2',
        'RD_3',
        'RD_4',
        'RD_5',
        'RD_6',
        'RD_7',
      },
    }
  end,
}
