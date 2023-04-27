local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
  "lua_ls",
  "vimls",
})

-- Required options for PS
require("lspconfig").powershell_es.setup{
  bundle_path = vim.fn.stdpath("data") .. "/mason/packages/PowerShellEditorServices/",
  shell = "powershell.exe",
}

-- Fix Undefined global 'vim'
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

--local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()


-- Add borders to completion menu
-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

cmp.setup({
  sources = {
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "buffer", keyword_length = 3},
    {name = "luasnip", keyword_length = 2},
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

