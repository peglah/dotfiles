" Bindings

" Leader key
  "nnoremap <SPACE> <Nop>
  let mapleader = "\<Space>"
  "map <SPACE> <leader>

" In normal mode, pressing ctrl + numpad's+ increases the font
  noremap <leader>+ :call AdjustFontSize(2)<CR>
  noremap <leader>- :call AdjustFontSize(-2)<CR>
  noremap <leader>0 :call NormalFontSize()<CR>

" Easier split navigations
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

" Insert date
  nnoremap <leader>. "=strftime("%F")<CR>Pa<CR><ESC>

" Spellcheck
  nnoremap <silent> <leader>o :setlocal spell spelllang=sv,en<CR>:set complete+=kspell<CR>
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=sv,en complete+=kspell

" Switch between the last two files
  nnoremap <leader><leader> <C-^>

" Edit this file
  nnoremap <leader>b :e $MYVIMRC<CR>

" Save and close buffer
  command Wbd write <bar> bdelete

" Config

" Highlight column after 'textwidth' in the help
  autocmd FileType help setlocal colorcolumn=+3
" Enable relative line numbers in the help
  autocmd FileType help setlocal relativenumber

" netrw - suppress the banner
  let g:netrw_banner=0
" netrw - tree style listing
  let g:netrw_liststyle=3

" Set title to: filename [+=-] (path) - NVIM
  set title
" Enable line number and relative line numbers
  set number relativenumber
" Maximum width of text that is being inserted.
  "set textwidth=80
" Highlight column after 'textwidth'
  "set colorcolumn=+1
" Enable copy/paste
  set clipboard^=unnamed,unnamedplus
" Disable mouse
  set mouse=
" Hide mode since Airline handles this
  set noshowmode

" Enable autocompletion
  set wildmode=longest:list,full
" Finding files
  set path+=**

" Ignoring case in a pattern
  set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case characters
  set smartcase

" On pressing tab, insert 2 spaces
  set expandtab
" show existing tab with 2 spaces width
  set tabstop=2
  set softtabstop=2
" when indenting with '>', use 2 spaces width
  set shiftwidth=2

" To use Powershell (on Windows)
  set shell=powershell shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8

" Disables automatic commenting on newline
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Functions

"Examples:
":call Exec('buffers')
"This will include the output of :buffers into the current buffer.
"
"Also try:
":call Exec('ls')
":call Exec('autocmd')

funct! Exec(command)
  redir =>output
  silent exec a:command
  redir END
  let @o = output
  execute "put o"
  return ''
endfunct!

" Plugins config

" Color scheme
set background=dark " or light if you want light mode
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

lua require('colorizer').setup()
lua require('neoscroll').setup()

" Better Rainbow Parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" minimap.vim
"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1

" Plugins

lua << EOF
-- Install if missing
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye candy
  use 'gruvbox-community/gruvbox'
  use 'karb94/neoscroll.nvim'
  --use 'sheerun/vim-polyglot'
  use 'vim-airline/vim-airline'

  -- Editing supports
  use 'kien/rainbow_parentheses.vim'
  use 'norcalli/nvim-colorizer.lua'
  --use 'wfxr/minimap.vim'

  --  Utility
  use 'sudormrfbin/cheatsheet.nvim'
  use 'tversteeg/registers.nvim'
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}}}
  use 'kshenoy/vim-signature'
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  end,
  config = {
    display = {
      open_fn = function()
        -- Using a floating window
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
EOF
