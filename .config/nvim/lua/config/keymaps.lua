-- Easier split navigations
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Esc to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Change to Normal mode by pressing "jj" in quick succession
vim.keymap.set("i", "jj", "<esc>", { desc = "Change to Normal mode" })

-- Resize windows using <Ctrl + Arrow keys>
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Increase window width" })

-- Save and close buffer
vim.api.nvim_create_user_command('Wbd', 'write <bar> bdelete', {})
-- Save and source file
vim.api.nvim_create_user_command('Wso', 'write <bar> source', {})
