return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()

    local wk = require('which-key')
    wk.add({
      { "<leader>", group = "leader" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "ChatGPT" },
      { "<leader>cb", group = "Backseat" },
      { "<leader>f", group = "Telescope" },
      { "<leader>l", group = "Lazy" },
      { "<leader>m", group = "Minimap" },

      -- Lazy
      { "<leader>lh", "<cmd>Lazy home<CR>", desc = "home" },
      { "<leader>li", "<cmd>Lazy install<CR>", desc = "install" },
      { "<leader>lu", "<cmd>Lazy update<CR>", desc = "update" },
      { "<leader>ls", "<cmd>Lazy sync<CR>", desc = "sync" },
      { "<leader>lx", "<cmd>Lazy clean<CR>", desc = "clean" },
      { "<leader>lc", "<cmd>Lazy check<CR>", desc = "check" },
      { "<leader>ll", "<cmd>Lazy log<CR>", desc = "log" },
      { "<leader>lr", "<cmd>Lazy restore<CR>", desc = "restore" },
      { "<leader>lp", "<cmd>Lazy profile<CR>", desc = "profile" },
      { "<leader>ld", "<cmd>Lazy debug<CR>", desc = "debug" },
      { "<leader>l?", "<cmd>Lazy help<CR>", desc = "help" },

      -- LSP
      { "K", "<cmd>lua require('pretty_hover').hover()<cr>", desc = "Hover" },
      { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition" },
      { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto Declaration" },
      { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Implementation" },
      { "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Goto Type Definition" },
      { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
      { "c-k", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", mode = "i" },
      { "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
      { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous Diagnostics" },
      { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    })

    vim.o.timeout = true
    vim.o.timeoutlen = 1000

    require('which-key').setup({
      win= {
        border = 'rounded',
      },
    })
  end
}
