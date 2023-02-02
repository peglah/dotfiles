return {
  'dense-analysis/neural',
  keys = "<C-Space>",
  dependencies = {
    'MunifTanjim/nui.nvim',
    'ElPiloto/significant.nvim' },
  config = function() require('neural').setup({
    open_ai = {
      api_key = os.getenv("OPENAI_API_KEY")
    }
  }) end
}
