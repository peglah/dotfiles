return {
  "Bryley/neoai.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "NeoAI",
    "NeoAIOpen",
    "NeoAIClose",
    "NeoAIToggle",
    "NeoAIContext",
    "NeoAIContextOpen",
    "NeoAIContextClose",
    "NeoAIInject",
    "NeoAIInjectCode",
    "NeoAIInjectContext",
    "NeoAIInjectContextCode",
  },
  keys = {
    { "<leader>ct", "<cmd>NeoAIToggle<cr>", desc = "NeoAIToggle" },
    { "<leader>cc", "<cmd>NeoAI<cr>", desc = "NeoAI" },
  },

  opts = {
    -- Options go here
  },
}
