require('plugins')

-- aTODO --
--print(vim.loop.os_uname().sysname)

--if(vim.fn.has('windows')){
--Windows specific config here
--}

-- Bindings --
--api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", {noremap = true})

-- Config --
-- Set language
vim.api.nvim_exec('language en_US', true)
-- Set title to: filename [+=-] (path) - NVIM
vim.opt.title = true
-- Enable line number and relative line numbers
vim.opt.relativenumber = true
-- Maximum width of text that is being inserted.
--vim.opt.textwidth = 80
-- Highlight column after 'textwidth'
--vim.opt.colorcolumn = '+1'
-- Hide mode since Airline handles this
vim.opt.showmode = false
-- Use system clipboard
vim.o.clipboard = 'unnamedplus'
-- Enable autocompletion
vim.opt.wildmode = {'longest:list', 'full'}
-- Finding files
vim.opt.path = vim.opt.path + ",**"

-- Ignoring case in a pattern
vim.opt.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.smartcase = true

-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true
-- show existing tab with 2 spaces width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- when indenting with '>', use 2 spaces width
vim.opt.shiftwidth = 2

-- netrw - suppress the banner
vim.g.netrw_banner = 0
-- netrw - tree style listing
vim.g.netrw_liststyle = 3

-- Highlight column after 'textwidth' in the help
vim.api.nvim_exec([[ autocmd FileType help setlocal colorcolumn=+3 ]], false)
-- Enable relative line numbers in the help
vim.api.nvim_exec([[ autocmd FileType help setlocal relativenumber ]], false)

-- Disables automatic commenting on newline
vim.api.nvim_exec([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]], false)
-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.api.nvim_exec([[ autocmd BufWritePre * %s/\s\+$//e ]], false)
vim.api.nvim_exec([[ autocmd BufWritePre * %s/\n\+\%$//e ]], false)
vim.api.nvim_exec([[ autocmd BufWritePre *.[ch] %s/\%$/\r/e ]], false)

-- Load plugins --
require('lualine').setup()
require('colorizer').setup()
require('neoscroll').setup()

--  Plugins config  --
--  ellisonleao/gruvbox.nvim
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- kien/rainbow_parentheses.vim
vim.api.nvim_exec([[ autocmd VimEnter * RainbowParenthesesToggleAll ]], false)

-- nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
--  ensure_installed = { "c", "lua", "rust" },
  ensure_installed = { "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
