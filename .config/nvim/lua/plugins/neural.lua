return {
  'dense-analysis/neural', -- AI code generation, editing and completion
  keys = "<C-Space>",
  dependencies = {
    'MunifTanjim/nui.nvim',
    'ElPiloto/significant.nvim' },
  config = function() require('neural').setup({
    open_ai = {
      api_key = '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'
    }
  }) end
}
