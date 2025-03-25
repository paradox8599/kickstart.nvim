return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  specs = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Neotree',
  opts_extend = { 'sources' },
  opts = function(_, opts)
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
    vim.keymap.set('n', '<leader>o', function()
      if vim.bo.filetype == 'neo-tree' then
        vim.cmd.wincmd 'p'
      else
        vim.cmd.Neotree 'focus'
      end
    end, { desc = 'Toggle Explorer Focus' })

    opts.enable_git_status = true
    opts.filesystem = {
      hijack_netrw_behavior = 'disabled',
      filtered_items = {
        hide_dotfiles = true,
        hide_by_name = {},
        hide_by_pattern = {},
        always_show = {
          '.env',
          '.env.local',
          '.env.prod',
          '.env.dev',
          '.env.test',
        },
        never_show = {},
        never_show_by_pattern = {},
      },
    }
    return opts
  end,
}
