-- dim inactive windows

return {
  {
    'tadaa/vimade',
    opts = {
      -- -- Recipe can be any of 'default', 'minimalist', 'duo', and 'ripple'
      -- -- Set animate = true to enable animations on any recipe.
      -- -- See the docs for other config options.
      recipe = { 'default', { animate = true } },

      --  'buffers', use 'windows' to fade inactive windows
      ncmode = 'windows',

      -- any value between 0 and 1. 0 is hidden and 1 is opaque.
      fadelevel = 0.7,

      tint = {
        -- bg = { rgb = { 0, 0, 0 }, intensity = 0.1 },
        -- fg = { rgb = { 0, 0, 0 }, intensity = 0.1 },
        -- fg = {rgb={120,120,120}, intensity=1}, -- all text will be gray
        -- sp = { rgb = { 255, 0, 0 }, intensity = 0.5 }, -- adds 50% red to special characters
        -- you can also use functions for tint or any value part in the tint object
        -- to create window-specific configurations
        -- see the `Tinting` section of the README for more details.
      },

      -- links diffs so that they style together
      groupdiff = true,

      -- link scrollbound windows so that they style together.
      groupscrollbind = false,

      -- -- enable to bind to FocusGained and FocusLost events. This allows fading inactive
      -- -- tmux panes.
      enablefocusfading = true,

      -- -- enables cursorhold event instead of using an async timer.  This may make Vimade
      -- -- feel more performant in some scenarios. See h:updatetime.
      usecursorhold = false,

      -- -- Time in milliseconds before re-checking windows. This is only used when usecursorhold
      -- -- is set to false.
      checkinterval = 1000,

      -- -- when nohlcheck is disabled the highlight tree will always be recomputed. You may
      -- -- want to disable this if you have a plugin that creates dynamic highlights in
      -- -- inactive windows. 99% of the time you shouldn't need to change this value.
      nohlcheck = true,
    },
  },
}
