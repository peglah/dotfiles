return {
  'nvim-lualine/lualine.nvim', -- Status/tabline
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  config = function() require('lualine').setup({
    theme = 'auto',
    sections = {
      lualine_c = {},
      lualine_y = {}
    },
    winbar = {
      lualine_a = {
        {
          'buffers',
          mode = 4,
          max_length = vim.o.columns * 2 / 3,
        }
      },
      lualine_y = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#FE8019" },
        }
      },
      lualine_z = { 'progress' }
    },
  }) end
}
