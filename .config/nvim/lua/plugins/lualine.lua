local copilot_indicator = function()
  local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
  if client == nil then
    return ""
  end

  if vim.tbl_isempty(client.requests) then
    return "⠶" -- default icon whilst copilot is idle
  end

  local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners

  return spinners[frame + 1]
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },

  opts = {
    theme = 'auto',
    sections = {
      lualine_c = { copilot_indicator },
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
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#FE8019' },
        }
      },
      lualine_z = {
        {
        'datetime',
        style = "%H:%M",
        }
      }
    },
  }
}
