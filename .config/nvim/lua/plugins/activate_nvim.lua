return {
  "roobert/activate.nvim",
  keys = {
    {
      "<leader>fp",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Plugins",
    },
  }
}
