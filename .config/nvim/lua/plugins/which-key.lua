return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = { name = "+leader" },
      ["<leader>f"] = { name = "+Telescope" },
      ["<leader>."] = { '"=strftime("%F")<CR>Pa<CR><ESC>', "Insert date" },
      ["<leader>o"] = { "<cmd>setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>", "Enable Spellcheck" },
      ["<leader><leader>"] = { "<C-^>", "Go to last buffer" },
      ["<leader>b"] = { "<cmd>e $MYVIMRC | cd %:p:h<cr>", "Edit init.lua" },
    })

    vim.o.timeout = true
    vim.o.timeoutlen = 1000
    require("which-key").setup() end
  }
