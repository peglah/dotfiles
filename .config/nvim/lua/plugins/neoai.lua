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
    { "<leader>cn", cmd = "NeoAI", desc = "NeoAI" },
    { "<leader>ct", cmd = "NeoAIToggle", desc = "NeoAIToggle" },
    { "<leader>cc", cmd = "NeoAIContext", desc = "NeoAIContext" },
    { "<leader>ci", cmd = "NeoAIInject", desc = "NeoAIInject" },
    { "<leader>cs", desc = "summarize text" },
  },

  opts = {
    -- Options go here
  },
}
