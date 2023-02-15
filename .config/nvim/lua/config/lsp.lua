vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false,
})

-- Required options for PS
require("lspconfig").powershell_es.setup{
  shell = "powershell.exe",
  bundle_path = vim.fn.stdpath("data") .. "/mason/packages/PowerShellEditorServices/",
}

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.setup()
