--local group = vim.api.nvim_create_augroup('mapping_cmds', {clear = true})

-- Easier split navigations
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Bindings
-- leader f
local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "+Telescope" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Search for files" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Search for a string" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Lists open buffers" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Lists available help tags" },
  ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Choose colorscheme" },
})

-- leader
wk.register({
  ["<leader>"] = { name = "+leader" },
  ["<leader>?"] = { "<cmd>Cheatsheet<cr>", "Searchable cheatsheet" },
  ["<leader>."] = { '"=strftime("%F")<CR>Pa<CR><ESC>', "Insert date" },
  ["<leader>o"] = { "<cmd>setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>", "Enable Spellcheck" },
  ["<leader><leader>"] = { "<C-^>", "Go to last buffer" },
  ["<leader>b"] = { "<cmd>e $MYVIMRC<cr>", "Edit init.lua" },
})

-- Save and close buffer
vim.api.nvim_create_user_command('Wbd', 'write <bar> bdelete', {})
-- Save and source file
vim.api.nvim_create_user_command('Wso', 'write <bar> source', {})
