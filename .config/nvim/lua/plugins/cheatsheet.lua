return {
  'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
  keys = "<leader><space>",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
  }
}
