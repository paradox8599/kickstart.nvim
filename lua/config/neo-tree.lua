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
  -- pattern = '*lazygit',
  callback = function()
    if package.loaded['neo-tree.sources.git_status'] then
      require('neo-tree.sources.git_status').refresh()
    end
  end,
})

local git_available = (vim.fn.executable 'git' == 1)

local sources = {
  { source = 'filesystem', display_name = 'File' },
  { source = 'buffers', display_name = 'Bufs' },
  { source = 'diagnostics', display_name = 'Diagnostic' },
}

if git_available then
  table.insert(sources, 3, { source = 'git_status', display_name = 'Git' })
end

require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = true,

  sources = {
    'filesystem',
    'buffers',
    git_available and 'git_status' or nil,
  },
  source_selector = {
    winbar = true,
    content_layout = 'center',
    sources = sources,
  },

  -- Window options
  window = {
    position = 'left',
    width = 30,
    mappings = {
      ['<tab>'] = 'next_source',
      ['<s-tab>'] = 'prev_source',
      [']b'] = 'next_source',
      ['[b'] = 'prev_source',
      ['<2-LeftMouse>'] = 'open',
      ['<cr>'] = 'open',
      ['<S-CR>'] = 'system_open',
      ['O'] = 'system_open',
      ['l'] = 'child_or_open',
      ['h'] = 'parent_or_close',
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
      hide_gitignored = git_available,
      hide_by_name = {
        'node_modules',
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
  commands = {
    ---@diagnostic disable-next-line: redundant-parameter
    system_open = function(state)
      vim.ui.open(state.tree:get_node():get_id())
    end,

    ---@diagnostic disable-next-line: redundant-parameter
    parent_or_close = function(state)
      local node = state.tree:get_node()
      if node:has_children() and node:is_expanded() then
        state.commands.toggle_node(state)
      else
        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
      end
    end,

    ---@diagnostic disable-next-line: redundant-parameter
    child_or_open = function(state)
      local node = state.tree:get_node()
      if node:has_children() then
        if not node:is_expanded() then -- if unexpanded, expand
          state.commands.toggle_node(state)
        else -- if expanded and has children, seleect the next child
          if node.type == 'file' then
            state.commands.open(state)
          else
            require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
          end
        end
      else -- if has no children
        state.commands.open(state)
      end
    end,
  },
}
