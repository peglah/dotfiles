return {
  "jackMort/ChatGPT.nvim", -- Interface for exploring GPT-3 and NLP.
  cmd = {
    'ChatGPT',
    'ChatGPTActAs',
    'ChatGPTEditWithInstructions' },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim" },
    config = function() require("chatgpt").setup(
      -- optional configuration
    )
  end
}
