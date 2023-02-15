vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false,
  manage_nvim_cmp = false
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

-- Add borders to completion menu
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require('cmp')
local cmp_config = lsp.defaults.cmp_config({
  window = {
    completion = cmp.config.window.bordered()
  }
})
cmp.setup(cmp_config)
