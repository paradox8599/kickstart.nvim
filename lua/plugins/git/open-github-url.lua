return {
  'tetzng/open-github-url.nvim',

  opts = {},

  keys = {
    { 'gh', vim.cmd.OpenGitHubUrlUnderCursor, desc = 'Open github url' },
  },
}
