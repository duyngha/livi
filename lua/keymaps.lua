------------------------------ TERMINAL --------------------------------------------
-- Enter normal mode from terminal mode: Press Ctrl-\ followed by Ctrl-n.
-- Enter terminal mode from normal mode: Press i in normal mode while in a terminal buffer.
------------------------------ TERMINAL --------------------------------------------

-- Open terminal in horizontal split
vim.api.nvim_set_keymap('n', '<leader>th', ':split | term<CR>', { noremap = true, silent = true })

-- Open terminal in vertical split
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | term<CR>', { noremap = true, silent = true })

-- Open terminal in current window
vim.api.nvim_set_keymap('n', '<leader>tt', ':term<CR>', { noremap = true, silent = true })

-- Close any window in normal mode
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })



------------------------------ WINDOW --------------------------------------------
-- Close terminal window (horizontal or vertical split)
vim.api.nvim_set_keymap('t', '<leader>tc', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })

-- Split the current file into a new vertical window
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })

-- Navigate between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

