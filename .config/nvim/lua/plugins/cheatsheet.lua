return {
  'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
  cmd = "Cheatsheet",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
  },
  config = true
}
