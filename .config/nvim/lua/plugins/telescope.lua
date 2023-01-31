return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'tsakirist/telescope-lazy.nvim'
  },

  config = function() require('telescope').setup({
    extensions = {
      lazy = {
        -- Optional theme (the extension doesn't set a default theme)
        --theme = "ivy",
        -- Whether or not to show the icon in the first column
        show_icon = true,
        -- Mappings for the actions
        mappings = {
          open_in_browser = "<C-o>",
          open_in_file_browser = "<M-b>",
          open_in_find_files = "<C-f>",
          open_in_live_grep = "<C-g>",
          open_plugins_picker = "<C-b>", -- Works only after having called first another action
          open_lazy_root_find_files = "<C-r>f",
          open_lazy_root_live_grep = "<C-r>g",
        },
      },
    },

    require("telescope").load_extension "lazy",

    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }
  }) end
}
