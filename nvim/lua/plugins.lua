local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup({ function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye candy
  use 'ellisonleao/gruvbox.nvim' -- Theme
  use 'karb94/neoscroll.nvim' -- Smooth scrolling
  use { 'nvim-lualine/lualine.nvim', -- Status/tabline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Distraction-free editing
  use 'folke/zen-mode.nvim' -- Distraction-free coding
  use 'folke/twilight.nvim' -- Dims inactive portions of the code you're editing

  -- Editing supports
  use 'p00f/nvim-ts-rainbow' -- Colorful parentheses
  use 'norcalli/nvim-colorizer.lua' -- Color highlighter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP stuff
  use 'junnplus/nvim-lsp-setup'
  use 'williamboman/nvim-lsp-installer' -- Allows you to seamlessly install LSP servers locally
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  --  Utility
  use { 'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
    requires = { { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }, } }
  use 'tversteeg/registers.nvim' -- Press " in normal or visual mode or Ctrl-R in insert mode
  --  use 'kshenoy/vim-signature'         -- Place, toggle and display marks

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
} })
