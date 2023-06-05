vim.keymap.set("n", "<leader>o", "<cmd>setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>", { desc = "Enable Spellcheck" })
vim.keymap.set("n", "<leader>d", "0f[lrxV/- [ <CR>kd/-DONE-<CR>p<cmd>noh<CR>", { desc = "Mark done and move to Done" })
vim.keymap.set("n", "<leader>.", '"=strftime("%F")<CR>Pa<CR><ESC>', { desc = "Insert date" })

-- Cursor does not jump back on yank
vim.keymap.set("v", "y", "ygv<Esc>", { desc = "Yank", remap = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Esc to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader><leader>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e $MYVIMRC | cd %:p:h<cr>", { desc= "Edit init.lua" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>split<cr>", { desc = "Open split" })
vim.keymap.set("n", "<leader>bv", "<cmd>vs<cr>", { desc = "Open vertical split" })

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

-- Write as sudo using tee invocation
--vim.keymap.set("c", "w!!", "w !sudo tee > /dev/null %", { silent = true, desc = "Write as Sudo" })
vim.api.nvim_create_user_command("Wsu", "w !sudo tee > /dev/null %", {})

