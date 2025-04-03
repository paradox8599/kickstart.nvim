return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = opts.ensure_installed or {}
        require('lib.utils').list_insert_unique(opts.ensure_installed, 'rust')
      end
    end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      require('lib.utils').list_insert_unique(opts.ensure_installed, 'codelldb')
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      require('lib.utils').list_insert_unique(opts.ensure_installed, 'codelldb')
    end,
  },

  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  {
    'nvim-neotest/neotest',
    optional = true,
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
      local rustaceanvim_avail, rustaceanvim = pcall(require, 'rustaceanvim.neotest')
      if rustaceanvim_avail then
        table.insert(opts.adapters, rustaceanvim)
      end
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = 'rust',
    lazy = false,
  },
}
