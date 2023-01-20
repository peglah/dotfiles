return {
  'nvim-lualine/lualine.nvim', -- Status/tabline
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  config = function() require('lualine').setup({
    section = { lualine_c = {} },
    inactive_section = { lualine_c = {} },
    winbar = {
      lualine_a = {
        {
          'buffers',
          mode = 4, -- 0: Shows buffer name, 1: Shows buffer index, 2: Shows buffer name + buffer index
          -- 3: Shows buffer number, 4: Shows buffer name + buffer number
          max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component
        }
      },
      lualine_z = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        }
      }
    },
  }) end
}
