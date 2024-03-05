local lsp = require("lsp-zero").preset({})

-- Required options for PS
require("lspconfig").powershell_es.setup{
  bundle_path = vim.fn.stdpath("data") .. "/mason/packages/PowerShellEditorServices/",
  shell = "powershell.exe",
}

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
        }
      }
    }
  }
}

require('lspconfig.ui.windows').default_options.border = 'rounded'

lsp.setup()

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
    {name = 'copilot'},
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
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  }
})

