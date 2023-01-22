return {
  'nvim-telescope/telescope.nvim',
  cmd = { 'Telescope' },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'BurntSushi/ripgrep' },
  },
  config = function() require('telescope').setup(
    -- optional configuration
  ) end
}
