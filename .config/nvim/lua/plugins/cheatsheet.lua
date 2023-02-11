return {
  'sudormrfbin/cheatsheet.nvim', -- Hit <leader>? to invoke cheatsheet telescope
  keys = { { "<leader>?", "<cmd>Cheatsheet<cr>", desc = "Searchable cheatsheet" } },
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/popup.nvim' },
  },
  config = true
}
