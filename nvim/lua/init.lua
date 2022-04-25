-- TODO --
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

require('nvim-lsp-setup').setup({
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
    -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
    default_mappings = true,
    -- Custom mappings
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {},
    -- Global on_attach
    -- on_attach = function(client, bufnr) {
    --     utils.format_on_save(client)
    -- },
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        powershell_es = {
          settings = {
            ['powershell_es'] = {
              bundle_path = 'C:/Users/z002d6kr/PowerShellEditorServices',
              cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', "C:/Users/z002d6kr/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1 ..."}
            },
          },
        },
    },
})

-- Plugins config --
-- gruvbox-community/gruvbox
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- kien/rainbow_parentheses.vim
vim.api.nvim_exec([[ autocmd VimEnter * RainbowParenthesesToggleAll ]], false)

-- Plugins --
-- Install Packer if missing
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye candy
  use 'gruvbox-community/gruvbox'     -- Theme
  use 'karb94/neoscroll.nvim'         -- Smooth scrolling
  --use 'vim-airline/vim-airline'       -- Status/tabline
  use {'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

  -- Editing supports
  use 'kien/rainbow_parentheses.vim'  -- Colorful parentheses
  use 'norcalli/nvim-colorizer.lua'   -- Color highlighter

  --  Utility
  use {'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
      requires = {{'nvim-telescope/telescope.nvim'},
                  {'nvim-lua/popup.nvim'},
                  {'nvim-lua/plenary.nvim'},}}
  use 'tversteeg/registers.nvim'      -- Press -- in normal or visual mode or Ctrl-R in insert mode
--  use 'kshenoy/vim-signature'         -- Place, toggle and display marks
  use {'junnplus/nvim-lsp-setup',     -- Wrapper for nvim-lspconfig and nvim-lsp-installer to setup LSP servers
      requires = {'neovim/nvim-lspconfig',
                  'williamboman/nvim-lsp-installer',}}

  end,
  config = {
    display = {
      open_fn = function()
        -- Using a floating window
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
