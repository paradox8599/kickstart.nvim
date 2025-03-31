return {
  {
    'b0o/SchemaStore.nvim',
    lazy = true,

    config = function()
      require('lspconfig').jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
      require('lspconfig').yamlls.setup {
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { 'json', 'jsonc' })
      end
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { 'jsonls', 'json-lsp' })
    end,
  },
}
