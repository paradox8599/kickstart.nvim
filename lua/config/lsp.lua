local function client_supports_method(client, method, bufnr)
  -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
  if vim.fn.has 'nvim-0.11' == 1 then
    return client.supports_method(method, bufnr)
  else
    return client.supports_method(method, { bufnr = bufnr })
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local picker = require 'snacks.picker'
    vim.keymap.set('n', 'gd', picker.lsp_definitions, { desc = 'Definition' })
    vim.keymap.set('n', 'gr', picker.lsp_references, { desc = 'References' })
    vim.keymap.set('n', 'gI', picker.lsp_implementations, { desc = 'Implementation' })
    vim.keymap.set('n', 'gt', picker.lsp_type_definitions, { desc = 'Type Definition' })
    vim.keymap.set('n', 'gD', picker.lsp_declarations, { desc = 'Declaration' })
    vim.keymap.set('n', '<leader>fs', picker.lsp_symbols, { desc = '[B]uffer Document [S]ymbols' })
    vim.keymap.set('n', '<leader>fS', picker.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- The following code creates a keymap to toggle inlay hints in your code, if the language server you are using supports them
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.keymap.set('n', '<leader>uh', function()
        require('lib.utils').toggle('Inlay Hint (Global)', function()
          return vim.lsp.inlay_hint.is_enabled()
        end, function(is_enabled)
          vim.lsp.inlay_hint.enable(not is_enabled)
        end)
      end, { desc = 'Toggle Inlay [H]ints (Global)' })
    end
  end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  --

  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',
  'rust_analyzer',
  'hadolint',
  'jsonlint',
  'vale',
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = {}, -- explicitly set to an empty table (populate installs via mason-tool-installer)
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}
