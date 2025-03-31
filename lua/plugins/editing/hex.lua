return {
  'RaafatTurki/hex.nvim',
  cmd = { 'HexDump', 'HexToggle', 'HexAssemble' },
  keys = {
    { '<leader>ub', vim.cmd.HexToggle, desc = 'Toggle Hex Editor' },
  },
  opts = {},
}
