------------------------------ TERMINAL --------------------------------------------
-- Enter normal mode from terminal mode: Press Ctrl-\ followed by Ctrl-n.
-- Enter terminal mode from normal mode: Press i in normal mode while in a terminal buffer.

-- Open terminal in horizontal split
vim.api.nvim_set_keymap('n', '<leader>th', ':split | term<CR>', { noremap = true, silent = true })

-- Open terminal in vertical split
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | term<CR>', { noremap = true, silent = true })

-- Open terminal in current window
vim.api.nvim_set_keymap('n', '<leader>tt', ':term<CR>', { noremap = true, silent = true })

-- Close any window in normal mode
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
------------------------------ END TERMINAL --------------------------------------------

------------------------------ TOGGLE TERM --------------------------------------------
-- Key mappings for ToggleTerm
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
------------------------------ #END TOGGLE TERM ---------------------------------------

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

------------------------------ LIVE GREP --------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })

------------------------------ DIAGNOSTIC --------------------------------------------

------------------------------ FILE EXPLORER --------------------------------------------
-- Map <leader>e to :NvimTreeOpen
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':NvimTreeClose<CR>', { noremap = true, silent = true })
