return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',

  keys = {
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Lists open buffers' },
    { "<Leader>fc",
      function()
        vim.api.nvim_exec_autocmds("User", { pattern = "ColorSchemeLoad" })
        require("telescope.builtin").colorscheme()
      end,
      desc = 'Choose colorscheme', noremap = true, },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Search for files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Search for a string' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Lists available help tags' },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Lists available keymaps' },
    { '<leader>fl', '<cmd>Telescope lazy<cr>', desc = 'Plugins installed via lazy.nvim' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Lists previously open files' },
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'tsakirist/telescope-lazy.nvim'
  },

  config = function() require('telescope').setup({
    defaults = {
      mappings = {
        n = {
          ["x"] = function(...)
            return require("telescope.actions").delete_buffer(...)
          end,
        },
      },
    },
    extensions = {
      lazy = {
        -- Optional theme (the extension doesn't set a default theme)
        --theme = 'ivy',
        -- Whether or not to show the icon in the first column
        show_icon = true,
        -- Mappings for the actions
        mappings = {
          open_in_browser = '<C-o>',
          open_in_file_browser = '<M-b>',
          open_in_find_files = '<C-f>',
          open_in_live_grep = '<C-g>',
          open_plugins_picker = '<C-b>', -- Works only after having called first another action
          open_lazy_root_find_files = '<C-r>f',
          open_lazy_root_live_grep = '<C-r>g',
        },
      },
    },

    require('telescope').load_extension 'lazy',

    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }
  }) end
}
