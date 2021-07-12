-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install if missing
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
  use 'gruvbox-community/gruvbox'
  use 'karb94/neoscroll.nvim'
  --use 'sheerun/vim-polyglot'
  use 'vim-airline/vim-airline'

  -- Editing supports
  use 'kien/rainbow_parentheses.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'wfxr/minimap.vim'

  --  Utility
  use 'sudormrfbin/cheatsheet.nvim'
  use 'tversteeg/registers.nvim'
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'}}}
  use 'kshenoy/vim-signature'

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
