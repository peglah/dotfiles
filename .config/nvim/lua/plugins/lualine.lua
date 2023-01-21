return {
  'nvim-lualine/lualine.nvim', -- Status/tabline
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  config = function() require('lualine').setup({
    sections = {
      lualine_c = {},
      lualine_y = {}
    },
    winbar = {
      lualine_a = {
        {
          'buffers',
          mode = 4, -- 0: Shows buffer name, 1: Shows buffer index, 2: Shows buffer name + buffer index
          -- 3: Shows buffer number, 4: Shows buffer name + buffer number
          max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component
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
