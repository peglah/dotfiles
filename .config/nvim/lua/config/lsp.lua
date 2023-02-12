local lsp = require('lsp-zero').preset({
  name = 'recommended',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
