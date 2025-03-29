return {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
  config = function()
    -- add more custom luasnip configuration such as filetype extend or custom snippets
    local luasnip = require 'luasnip'
    luasnip.filetype_extend('javascript', { 'javascriptreact' })
    luasnip.filetype_extend('typescript', { 'javascript', 'javascriptreact', 'typescriptreact' })
    -- load snippets paths
    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { vim.fn.stdpath 'config' .. '/snippets' },
    }
  end,
}
