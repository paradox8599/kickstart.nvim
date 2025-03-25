-- [[ General Keymaps ]]
-- Plugin specific keymaps are defined in their own files

-- See `:help vim.keymap.set()`
local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- See `:help hlsearch`
map('<Esc>', '<cmd>nohlsearch<cr>', 'Clear search highlights')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('<leader>y', '"+y', 'Yank to system clipboard', { 'n', 'x' })
map('<leader>p', '"_dP', 'Paste without yank', { 'x' })

map('<C-q>', '<cmd>quit<cr>', 'Quit')
map('<C-s>', '<cmd>w<cr>', 'Save')
