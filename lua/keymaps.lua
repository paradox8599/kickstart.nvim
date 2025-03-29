-- [[ General Keymaps ]]
-- Plugin specific keymaps are defined in their own files

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlights' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<cr>]], { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<cr>]], { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<cr>]], { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<cr>]], { desc = 'Move focus to the right window' })

-- split
vim.keymap.set('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })

-- yank
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard', noremap = true })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yank', noremap = true })

-- navigation
vim.keymap.set('n', '<leader>k', '<cmd>b#<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor position when J' })

-- lsp
vim.keymap.set('n', '<leader>lc', '<cmd>LspRestart<cr>', { desc = 'Restart LSP' })

-- actions
vim.keymap.set('n', '<C-q>', '<cmd>quit<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save' })

-- lua
vim.keymap.set('n', '<space>X', '<cmd>source %<cr>', { desc = 'Run this lua file' })
vim.keymap.set('n', '<space>x', ':.lua<cr>', { desc = 'Run this line' })
vim.keymap.set('v', '<space>x', ':lua<cr>', { desc = 'Run selection' })

vim.keymap.set('n', '<leader>fT', require('snacks').picker.colorschemes, { desc = '[F]ind [T]heme' })
