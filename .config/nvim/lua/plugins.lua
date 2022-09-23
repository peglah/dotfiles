local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Eye candy
    use 'ellisonleao/gruvbox.nvim' -- Theme
    use { 'karb94/neoscroll.nvim', -- Smooth scrolling
      config = function() require('neoscroll').setup() end }
    use { 'nvim-lualine/lualine.nvim', -- Status/tabline
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require('lualine').setup() end }

    -- Distraction-free editing
    use { 'folke/zen-mode.nvim', -- Distraction-free coding
      config = function() require('zen-mode').setup() end }
    use { 'folke/twilight.nvim', -- Dims inactive portions of the code you're editing
      config = function() require('twilight').setup() end }

    -- Editing supports
    use { 'p00f/nvim-ts-rainbow', -- Colorful parentheses
      branch = 'master' }
    use { 'NvChad/nvim-colorizer.lua', -- Color highlighter
      config = function() require('colorizer').setup() end }
    use 'nvim-treesitter/nvim-treesitter'

    --  Utility
    use { 'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' }, } }
    use 'tversteeg/registers.nvim' -- Press " in normal or visual mode or Ctrl-R in insert mode
    --  use 'kshenoy/vim-signature'         -- Place, toggle and display marks

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
