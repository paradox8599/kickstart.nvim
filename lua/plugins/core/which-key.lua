-- loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require 'config.which-key'
  end,
}
