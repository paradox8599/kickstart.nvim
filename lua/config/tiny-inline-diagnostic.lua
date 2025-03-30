require('tiny-inline-diagnostic').setup {
  -- preset: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
  preset = 'modern',
  options = {
    -- Show the source of the diagnostic.
    show_source = false,

    -- Use your defined signs in the diagnostic config table.
    use_icons_from_diagnostic = true,

    -- Add messages to the diagnostic when multilines is enabled
    add_messages = true,

    throttle = 0,

    -- The minimum length of the message, otherwise it will be on a new line.
    softwrap = 30,

    -- If multiple diagnostics are under the cursor, display all of them.
    multiple_diag_under_cursor = true,

    multilines = { enabled = true, always_show = true },

    -- Show all diagnostics on the cursor line.
    show_all_diags_on_cursorline = true,

    -- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
    enable_on_insert = true,

    -- warp, none, oneline
    overflow = { mode = 'wrap' },

    -- Format the diagnostic message.
    -- Example:
    -- format = function(diagnostic)
    --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
    -- end,
    format = nil,

    --- Enable it if you want to always have message with `after` characters length.
    break_line = { enabled = false, after = 32 },

    virt_texts = { priority = 2048 },

    -- Filter by severity.
    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
      vim.diagnostic.severity.INFO,
      vim.diagnostic.severity.HINT,
    },
  },
}

vim.diagnostic.config { virtual_text = false }
