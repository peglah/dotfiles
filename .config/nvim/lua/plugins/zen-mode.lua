return {
  'folke/zen-mode.nvim', -- Distraction-free coding
  cmd = 'ZenMode',
  config = function() require('zen-mode').setup() end
}
