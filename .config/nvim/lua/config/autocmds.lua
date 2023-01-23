-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]], false)
vim.cmd([[ autocmd BufWritePre * %s/\n\+\%$//e ]], false)
vim.cmd([[ autocmd BufWritePre *.[ch] %s/\%$/\r/e ]], false)

-- Highlight column after 'textwidth' in the help
--vim.cmd([[ autocmd FileType help setlocal colorcolumn=+3 ]], false)
-- Enable relative line numbers in the help
vim.cmd([[ autocmd FileType help setlocal relativenumber ]], false)

-- Disables automatic commenting on newline
vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]], false)

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
