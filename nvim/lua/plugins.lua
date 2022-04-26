local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye candy
  use 'ellisonleao/gruvbox.nvim'      -- Theme
  use 'karb94/neoscroll.nvim'         -- Smooth scrolling
  use {'nvim-lualine/lualine.nvim',   -- Status/tabline
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

  -- Editing supports
  use 'kien/rainbow_parentheses.vim'  -- Colorful parentheses
  use 'norcalli/nvim-colorizer.lua'   -- Color highlighter
  use 'nvim-treesitter/nvim-treesitter'



  --  Utility
  use {'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
      requires = {{'nvim-telescope/telescope.nvim'},
                  {'nvim-lua/popup.nvim'},
                  {'nvim-lua/plenary.nvim'},}}
  use 'tversteeg/registers.nvim'      -- Press " in normal or visual mode or Ctrl-R in insert mode
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
}})
