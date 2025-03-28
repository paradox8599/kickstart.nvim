-- docs: https://cmp.saghen.dev

return {
  {
    'Saghen/blink.cmp',

    build = 'cargo build --release',

    config = function()
      require 'config.blink'
    end,
  },
}
