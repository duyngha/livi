------------------------------ TERMINAL --------------------------------------------
-- Enter normal mode from terminal mode: Press Ctrl-\ followed by Ctrl-n.
-- Enter terminal mode from normal mode: Press i in normal mode while in a terminal buffer.

-- Toggle a floating terminal over the current working window.
-- The terminal buffer is reused across toggles, so the shell session persists.
local term = { buf = -1, win = -1 }

local function toggle_terminal()
  -- If the floating window is open, hide it.
  if vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    return
  end

  -- Create the terminal buffer once and keep it around.
  if not vim.api.nvim_buf_is_valid(term.buf) then
    term.buf = vim.api.nvim_create_buf(false, true)
  end

  -- Size the float to 80% of the editor, centered.
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  term.win = vim.api.nvim_open_win(term.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded',
    title = ' Terminal ',
    title_pos = 'center',
  })

  -- Start a shell the first time the buffer is shown.
  if vim.bo[term.buf].buftype ~= 'terminal' then
    vim.fn.termopen(vim.o.shell)
  end

  vim.cmd('startinsert')
end

-- <leader>tt toggles the floating terminal from normal or terminal mode.
vim.keymap.set({ 'n', 't' }, '<leader>tt', toggle_terminal, { noremap = true, silent = true, desc = 'Toggle floating terminal' })
------------------------------ END TERMINAL --------------------------------------------

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
