local group = vim.api.nvim_create_augroup('mapping_cmds', {clear = true})

-- Easier split navigations
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Cheatsheet
vim.keymap.set('n', '<leader>?', ':Cheatsheet<CR>', { silent = true })

-- Insert date
vim.keymap.set('n', '<leader>.', '"=strftime("%F")<CR>Pa<CR><ESC>', { silent = true })

-- Spellcheck
vim.keymap.set('n', '<leader>o', ':setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>', { silent = true })

-- Switch between the last two files
vim.keymap.set('n', '<leader><leader>', '<C-^>')

-- Edit init.lua
vim.keymap.set('n', '<leader>b', ':e $MYVIMRC<CR>', { silent = true })

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Save and close buffer
vim.api.nvim_create_user_command('Wbd', 'write <bar> bdelete', {})
