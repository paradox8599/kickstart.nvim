-- [[ General Keymaps ]]
-- Plugin specific keymaps are defined in their own files

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlights' })

vim.keymap.set('t', '<C-i>', [[<cmd>hide<cr>]], { desc = 'Hide Terminal' })
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
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })

vim.keymap.set('n', '<C-d>', '15j', { desc = 'Scroll down by 5 lines' })
vim.keymap.set('n', '<C-u>', '15k', { desc = 'Scroll up by 5 lines' })

vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { silent = true })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { silent = true })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { silent = true })
vim.keymap.set('n', 'L', '<cmd>bnext<cr>', { silent = true })
vim.keymap.set('n', 'H', '<cmd>bprev<cr>', { silent = true })

vim.keymap.set('n', '<leader>k', '<cmd>b#<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor position when J' })

-- shortcuts
vim.keymap.set('n', '<C-q>', '<cmd>quit<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', '<cmd>quitall<cr>', { desc = 'Quit All' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save' })

vim.keymap.set('n', '+', '<C-w>|<C-w>_', { desc = 'Maximize current pane' })
vim.keymap.set('n', '=', '<C-w>=', { desc = 'Restore pane sizes' })

-- buffer delete
vim.keymap.set('n', '<leader>c', function()
  require('snacks').bufdelete.delete()
end, { desc = 'Close Buffer', silent = true })
vim.keymap.set('n', '<leader>bc', function()
  require('snacks').bufdelete.other()
end, { desc = 'Close Other Buffers', silent = true })

-- lua
vim.keymap.set('n', '<leader><leader>R', '<cmd>source %<cr>', { desc = 'Run this lua file' })
vim.keymap.set('n', '<leader><leader>r', ':.lua<cr>', { desc = 'Run this line' })
vim.keymap.set('x', '<leader><leader>r', ':lua<cr>', { desc = 'Run selection' })

-- lsp
-- vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })
vim.keymap.set('n', '<leader>lc', '<cmd>LspRestart<cr>', { desc = 'Restart LSP' })
vim.keymap.set({ 'n', 'x' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code [A]ction' })

-- disables Select Mode
-- vim.keymap.set('n', 'gh', '')
vim.keymap.set('n', 'gH', '')
vim.keymap.set('n', 'g<C-h>', '')
