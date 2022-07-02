local vim = vim
require('plugins')

-- aTODO --
--print(vim.loop.os_uname().sysname)

--if(vim.fn.has('windows')){
--Windows specific config here
--}

-- Bindings --
--api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", {noremap = true})

-- Config --
-- Set language
vim.cmd('language en_US', true)
-- Set title to: filename [+=-] (path) - NVIM
vim.opt.title = true
-- Enable line number and relative line numbers
vim.opt.relativenumber = true
-- Maximum width of text that is being inserted.
--vim.opt.textwidth = 80
-- Highlight column after 'textwidth'
--vim.opt.colorcolumn = '+1'
-- Hide mode since Airline handles this
vim.opt.showmode = false
-- Use system clipboard
vim.o.clipboard = 'unnamedplus'
-- Enable autocompletion
vim.opt.wildmode = { 'longest:list', 'full' }
-- Finding files
vim.opt.path = vim.opt.path + ",**"
-- Set font
vim.cmd([[ set guifont=FiraMono\ NF:h15 ]], false)
-- Fancy colors
vim.opt.termguicolors = true

-- Ignoring case in a pattern
vim.opt.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.smartcase = true

-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true
-- show existing tab with 2 spaces width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- when indenting with '>', use 2 spaces width
vim.opt.shiftwidth = 2

-- netrw - suppress the banner
vim.g.netrw_banner = 0
-- netrw - tree style listing
vim.g.netrw_liststyle = 3

-- Highlight column after 'textwidth' in the help
vim.cmd([[ autocmd FileType help setlocal colorcolumn=+3 ]], false)
-- Enable relative line numbers in the help
vim.cmd([[ autocmd FileType help setlocal relativenumber ]], false)

-- Disables automatic commenting on newline
vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]], false)
-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]], false)
vim.cmd([[ autocmd BufWritePre * %s/\n\+\%$//e ]], false)
vim.cmd([[ autocmd BufWritePre *.[ch] %s/\%$/\r/e ]], false)

--  Plugins config  --
--  ellisonleao/gruvbox.nvim
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- nvim-treesitter/nvim-treesitter
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  --  ensure_installed = { "c", "lua", "rust" },
  ensure_installed = { "c", "cpp", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

-- Lsp setup

-- junnplus/nvim-lsp-setup
require('nvim-lsp-setup').setup({
  -- Default mappings
  -- gD = 'lua vim.lsp.buf.declaration()',
  -- gd = 'lua vim.lsp.buf.definition()',
  -- gt = 'lua vim.lsp.buf.type_definition()',
  -- gi = 'lua vim.lsp.buf.implementation()',
  -- gr = 'lua vim.lsp.buf.references()',
  -- K = 'lua vim.lsp.buf.hover()',
  -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
  -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
  -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
  -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
  -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
  -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
  -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
  default_mappings = true,
  -- Custom mappings, will overwrite the default mappings for the same key
  -- Example mappings for telescope pickers:
  -- gd = 'lua require"telescope.builtin".lsp_definitions()',
  -- gi = 'lua require"telescope.builtin".lsp_implementations()',
  -- gr = 'lua require"telescope.builtin".lsp_references()',
  mappings = {},
  -- Global on_attach
  -- on_attach = function(client, bufnr)
  --     require('nvim-lsp-setup.utils').format_on_save(client)
  -- end,
  -- Global capabilities
  -- capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- Configuration of LSP servers
  servers = {
    -- Install LSP servers automatically
    -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    --ccls = {},
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    },
  },
})

-- hrsh7th/cmp-nvim-lsp
require 'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
