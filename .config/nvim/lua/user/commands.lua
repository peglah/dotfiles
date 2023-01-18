-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]], false)
vim.cmd([[ autocmd BufWritePre * %s/\n\+\%$//e ]], false)
vim.cmd([[ autocmd BufWritePre *.[ch] %s/\%$/\r/e ]], false)

-- Source ginit if a GUI is used
--vim.api.nvim_create_autocmd( "UIEnter", {
--  once = true,
--  callback = function() require "ginit" end
--} )
