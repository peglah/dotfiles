return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = { name = "+leader" },
      ["<leader>f"] = { name = "+Telescope" },
      ["<leader>l"] = { name = "+Lazy" },
      ["<leader>."] = { '"=strftime("%F")<CR>Pa<CR><ESC>', "Insert date" },
      ["<leader>o"] = { "<cmd>setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>", "Enable Spellcheck" },
      ["<leader>d"] = { "f[lrxV/- [ <CR>kd/-DONE-<CR>p<cmd>noh<CR>", "Mark done and move to Done" },
      ["<leader><leader>"] = { "<C-^>", "Go to last buffer" },
      ["<leader>b"] = { "<cmd>e $MYVIMRC | cd %:p:h<cr>", "Edit init.lua" },
      ["<leader>lh"] = { "<cmd>Lazy home<CR>", "home" },
      ["<leader>li"] = { "<cmd>Lazy install<CR>", "install" },
      ["<leader>lu"] = { "<cmd>Lazy update<CR>", "update" },
      ["<leader>ls"] = { "<cmd>Lazy sync<CR>", "sync" },
      ["<leader>lx"] = { "<cmd>Lazy clean<CR>", "clean" },
      ["<leader>lc"] = { "<cmd>Lazy check<CR>", "check" },
      ["<leader>ll"] = { "<cmd>Lazy log<CR>", "log" },
      ["<leader>lr"] = { "<cmd>Lazy restore<CR>", "restore" },
      ["<leader>lp"] = { "<cmd>Lazy profile<CR>", "profile" },
      ["<leader>ld"] = { "<cmd>Lazy debug<CR>", "debug" },
      ["<leader>l?"] = { "<cmd>Lazy help<CR>", "help" },
    })

    vim.o.timeout = true
    vim.o.timeoutlen = 1000
    require("which-key").setup() end
  }
