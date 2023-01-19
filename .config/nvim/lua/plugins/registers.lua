return {
  'tversteeg/registers.nvim', -- Press " in normal or visual mode or Ctrl-R in insert mode
  keys = "\"",
  config = function() require('registers').setup() end
}
