return {
  {
    'neovim/nvim-lspconfig',

    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates on bottom-right for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      require 'config.lsp'
    end,
  },
}
