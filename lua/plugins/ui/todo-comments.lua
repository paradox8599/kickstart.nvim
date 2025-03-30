-- Highlight todo, notes, etc in comments

return {
  'folke/todo-comments.nvim',

  event = 'VeryLazy',

  keys = {
    {
      '<leader>ft',
      function()
        ---@diagnostic disable-next-line: undefined-field
        require('snacks').picker.todo_comments()
      end,
      desc = 'Todo',
    },
  },

  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = { signs = false },
}
