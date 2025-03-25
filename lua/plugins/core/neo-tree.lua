return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Neotree',
  opts = function(_, opts)
    -- Keymaps
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
    vim.keymap.set('n', '<leader>o', function()
      if vim.bo.filetype == 'neo-tree' then
        vim.cmd.wincmd 'p'
      else
        vim.cmd.Neotree 'focus'
      end
    end, { desc = 'Toggle Explorer Focus' })
    vim.keymap.set('n', '<leader>bf', '<cmd>Neotree buffers reveal float<cr>', { desc = 'Find Buffer' })

    -- General options
    opts.close_if_last_window = true
    opts.popup_border_style = 'rounded'
    opts.enable_git_status = true
    opts.enable_diagnostics = true
    opts.sort_case_insensitive = true
    opts.default_component_configs = {
      indent = { padding = 1 },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '',
          renamed = '➜',
          untracked = '',
          ignored = '',
          unstaged = '✗',
          staged = '',
          conflict = '',
        },
      },
    }

    -- Window options
    opts.window = {
      position = 'left',
      width = 30,
      mappings = {
        ['<space>'] = 'toggle_node',
        ['<2-LeftMouse>'] = 'open',
        ['<cr>'] = 'open',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['P'] = { 'toggle_preview', config = { use_float = true } },
        ['S'] = 'open_split',
        ['s'] = 'open_vsplit',
        ['t'] = 'open_tabnew',
        ['C'] = 'close_node',
        ['a'] = 'add',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
      },
    }

    -- Filesystem options
    opts.filesystem = {
      hijack_netrw_behavior = 'disabled',
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          'node_modules',
          '.git',
          '.DS_Store',
          'thumbs.db',
        },
        hide_by_pattern = {
          '*.meta',
          '*/src/*/tsconfig.json',
        },
        always_show = {
          '.env',
          '.env.local',
          '.env.prod',
          '.env.dev',
          '.env.test',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
        },
        never_show_by_pattern = {
          '.null-ls_*',
          '*.pyc',
        },
      },
      components = {
        harpoon_index = function(config, node, _)
          local Marked = require 'harpoon.mark'
          local path = node:get_id()
          local succuss, index = pcall(Marked.get_index_of, path)
          if succuss and index and index > 0 then
            return {
              text = string.format(' ⚡%d', index),
              highlight = config.highlight or 'NeoTreeDirectoryIcon',
            }
          else
            return {}
          end
        end,
      },
    }

    -- Buffers options
    opts.buffers = {
      follow_current_file = { enabled = true },
      show_unloaded = true,
      window = {
        mappings = {
          ['bd'] = 'buffer_delete',
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root',
        },
      },
    }

    return opts
  end,
}
