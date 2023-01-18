local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Eye candy
    use 'ellisonleao/gruvbox.nvim' -- Theme
    use { 'karb94/neoscroll.nvim', -- Smooth scrolling
    config = function() pcall(require, 'plugins.neoscroll') end }
    use { 'nvim-lualine/lualine.nvim', -- Status/tabline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() pcall(require, 'plugins.lualine') end }

    -- Distraction-free editing
    use { 'folke/zen-mode.nvim', -- Distraction-free coding
    config = function() pcall(require, 'plugins.zen-mode') end }
    use { 'folke/twilight.nvim', -- Dims inactive portions of the code you're editing
    config = function() pcall(require, 'plugins.twilight') end }

    -- Editing supports
    use { 'mrjones2014/nvim-ts-rainbow', -- Colorful parentheses
    branch = 'master' }
    use { 'norcalli/nvim-colorizer.lua', -- Color highlighter
    config = function() pcall(require, 'plugins.colorizer') end }
    use 'nvim-treesitter/nvim-treesitter'

    --  Utility
    use { 'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }, } }
      use { 'tversteeg/registers.nvim', -- Press " in normal or visual mode or Ctrl-R in insert mode
      config = function() pcall(require, 'plugins.registers') end }

      --  use 'kshenoy/vim-signature'         -- Place, toggle and display marks

      -- LSP
      use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          -- Snippet Collection (Optional)
          {'rafamadriz/friendly-snippets'},
        },
        config = function() pcall(require, 'plugins.lsp-zero') end }

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
        require("packer").sync()
      end
    end,
    config = {
      -- Using a floating window
      display = {
        open_fn = function()
          return require('packer.util').float({ border = 'single' })
        end
      },
      -- Profile the time taken loading your plugins
      profile = {
        enable = true,
        threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
      },
    },
  })
