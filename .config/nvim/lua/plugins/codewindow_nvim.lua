return {
  'gorbit99/codewindow.nvim',
  opts = {
    window_border = 'rounded', -- The border style of the floating window (accepts all usual options)
  },
  config = function(PluginSpec, opts)
    local codewindow = require('codewindow')
    codewindow.setup(opts)
    codewindow.apply_default_keybinds()
  end,
}
