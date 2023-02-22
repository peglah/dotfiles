return {
  'dense-analysis/neural',
  keys = '<C-Space>',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'ElPiloto/significant.nvim'
  },

  opts = {
    source = {
      openai = {
        api_key = vim.env.OPENAI_API_KEY,
      }
    }
  }
}
