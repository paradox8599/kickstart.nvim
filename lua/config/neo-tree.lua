-- Keymaps
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Explorer' })
vim.keymap.set('n', '<leader>o', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd.wincmd 'p'
  else
    vim.cmd.Neotree 'focus'
  end
end, { desc = 'Explorer Focus' })
vim.keymap.set('n', '<leader>bb', '<cmd>Neotree buffers reveal float<cr>', { desc = 'Find Buffer' })

-- update git status on (lazygit) terminal close
vim.api.nvim_create_autocmd('TermClose', {
  pattern = '*lazygit',
  callback = function()
    if package.loaded['neo-tree.sources.git_status'] then
      require('neo-tree.sources.git_status').refresh()
    end
  end,
})

require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = true,

  -- Window options
  window = {
    position = 'left',
    width = 30,
    mappings = {
      ['<tab>'] = 'toggle_node',
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
  },

  -- Filesystem options
  filesystem = {
    -- use_libuv_file_watcher = true,
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
  },

  -- Buffers options
  buffers = {
    follow_current_file = { enabled = true },
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
      },
    },
  },

  default_component_configs = {
    indent = { padding = 1 },
    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '➜',
        untracked = '',
        ignored = '◌',
        unstaged = '✗',
        staged = '',
        conflict = '',
      },
    },

    icon = {
      provider = function(icon, node)
        local text, hl
        local mini_icons = require 'mini.icons'
        if node.type == 'file' then
          text, hl = mini_icons.get('file', node.name)
        elseif node.type == 'directory' then
          text, hl = mini_icons.get('directory', node.name)
          if node:is_expanded() then
            text = nil
          end
        end

        if text then
          icon.text = text
        end
        if hl then
          icon.highlight = hl
        end
      end,
    },
    kind_icon = {
      provider = function(icon, node)
        icon.text, icon.highlight = require('mini.icons').get('lsp', node.extra.kind.name)
      end,
    },
  },
}
