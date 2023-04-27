return {
  'neanias/everforest-nvim',
  event = "User ColorSchemeLoad",

  config = function()
    require("everforest").setup({
      -- Your config here
    })
  end,
}
