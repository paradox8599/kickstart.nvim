-- cursor animation

return {
  'sphamba/smear-cursor.nvim',
  cond = not vim.g.neovide,
  opts = {
    -- General configuration -------------------------------------------------------

    -- Smear cursor when switching buffers or windows
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines
    smear_between_neighbor_lines = true,

    -- Smear cursor when entering or leaving command line mode
    smear_to_cmd = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = true,

    -- Set to `true` if your cursor is a vertical bar in normal mode.
    -- Use with `matrix_pixel_threshold = 0.3`
    vertical_bar_cursor = false,

    -- Attempt to hide the real cursor by drawing a character below it.
    hide_target_hack = true,

    -- Number of windows that stay open for rendering.
    max_kept_windows = 100,

    -- Adjust to have the smear appear above or below other floating windows
    windows_zindex = 300,

    -- List of filetypes where the plugin is disabled.
    filetypes_disabled = {},

    -- Sets animation framerate
    time_interval = 16, -- milliseconds

    -- After changing target position, wait before triggering animation.
    -- Useful if the target changes and rapidly comes back to its original position.
    -- E.g. when hitting a keybinding that triggers CmdlineEnter.
    -- Increase if the cursor makes weird jumps when hitting keys.
    delay_animation_start = 0, -- milliseconds

    -- Smear configuration ---------------------------------------------------------

    -- How fast the smear's head moves towards the target.
    -- 0: no movement, 1: instantaneous
    stiffness = 0.6,

    -- How fast the smear's tail moves towards the target.
    -- 0: no movement, 1: instantaneous
    trailing_stiffness = 0.3,

    -- Controls if middle points are closer to the head or the tail.
    -- < 1: closer to the tail, > 1: closer to the head
    trailing_exponent = 2,

    -- How much the smear slows down when getting close to the target.
    -- < 0: less slowdown, > 0: more slowdown. Keep small, e.g. [-0.2, 0.2]
    slowdown_exponent = 0,

    -- Stop animating when the smear's tail is within this distance (in characters) from the target.
    distance_stop_animating = 0.1,

    -- When to switch between rasterization methods
    max_slope_horizontal = 0.5,
    min_slope_vertical = 2,

    color_levels = 16, -- Minimum 1, don't set manually if using cterm_cursor_colors
    gamma = 2.2, -- For color blending
    max_shade_no_matrix = 0.75, -- 0: more overhangs, 1: more matrices
    matrix_pixel_threshold = 0.7, -- 0: all pixels, 1: no pixel
    matrix_pixel_min_factor = 0.5, -- 0: all pixels, 1: no pixel
    volume_reduction_exponent = 0.3, -- 0: no reduction, 1: full reduction
    minimum_volume_factor = 0.7, -- 0: no limit, 1: no reduction
    max_length = 25, -- Maximum smear length
  },
}
