return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = opts.ensure_installed or {}
        require('lib.utils').list_insert_unique(opts.ensure_installed, 'toml')
      end
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      require('lib.utils').list_insert_unique(opts.ensure_installed, 'taplo')
    end,
  },
}
