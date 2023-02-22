return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "VeryLazy",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
--        panel = {
--          autorefresh = true
--        },
        suggestion = {
          auto_trigger = true
        }
      })
    end, 100)
  end,
}
