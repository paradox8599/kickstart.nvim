local gitsigns = require 'gitsigns'

gitsigns.setup {
  -- TODO: colors?
  signs = {
    add = { text = '┃' },
    change = { text = '┃' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },

  signs_staged = {
    add = { text = '┃' },
    change = { text = '┃' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },

  signs_staged_enable = true,
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true,
  },

  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 150,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },

  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then
        vim.cmd.normal { ']g', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git change' })

    map('n', '[g', function()
      if vim.wo.diff then
        vim.cmd.normal { '[g', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git change' })

    -- visual mode
    map('x', '<leader>gs', function()
      gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = 'git [s]tage hunk' })
    map('x', '<leader>hr', function()
      gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = 'git [r]eset hunk' })
    -- normal mode
    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git [r]eset hunk' })
    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Git [S]tage buffer' })
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
    map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git [b]lame line' })
    map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
    map('n', '<leader>gD', function()
      gitsigns.diffthis '@'
    end, { desc = 'git [D]iff against last commit' })
    -- Toggles
    map('n', '<leader>ub', gitsigns.toggle_current_line_blame, { desc = 'Toggle Inline [B]lame' })
    map('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = 'Git [p]review hunk inline' })
    map('n', '<leader>gP', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
  end,
}
