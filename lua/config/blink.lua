require('blink.cmp').setup {
  keymap = {
    preset = 'none',
    ['<CR>'] = {},
    ['<Enter>'] = {},
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-x>'] = { 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide' },
    ['<C-y>'] = { 'select_and_accept' },

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'show', 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'show', 'select_next', 'fallback_to_mappings' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    ['<C-j>'] = { 'fallback_to_mappings' },
  },

  cmdline = {
    keymap = {
      ['<Tab>'] = { 'show', 'accept' },
    },
    completion = {
      ghost_text = { enabled = true },
      menu = { auto_show = true },
    },
  },

  completion = {
    -- 'prefix' will fuzzy match on the text before the cursor
    -- 'full' will fuzzy match on the text before _and_ after the cursor
    -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
    keyword = { range = 'full' },

    accept = { auto_brackets = { enabled = true } },

    documentation = { auto_show = true, auto_show_delay_ms = 150 },

    list = { selection = { preselect = false, auto_insert = true } },

    menu = { auto_show = true },

    ghost_text = { enabled = true },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },

  sources = {
    -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
    -- default = { "lsp", "path", "luasnip", "snippets", "buffer", "omni" },
  },

  -- Use a preset for snippets, check the snippets documentation for more information
  -- 'default' | 'luasnip' | 'mini_snippets'
  snippets = { preset = 'luasnip' },

  signature = {
    enabled = true,
    window = { show_documentation = true },
  },
}
