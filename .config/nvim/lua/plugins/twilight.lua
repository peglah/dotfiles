return
  { 'folke/twilight.nvim', -- Dims inactive portions of the code you're editing
  cmd = 'Twilight',
  config = function() require('twilight').setup() end
}
