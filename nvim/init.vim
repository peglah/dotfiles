"           ---------------
"           |   Plugins   |
"           ---------------

" Install vim-plug if missing
let vimplug_exists=expand('~\AppData\Local\nvim-data\site\autoload\plug.vim')
if !filereadable(vimplug_exists)
"  exec "!iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force"
  silent exec '!curl.exe -fLo '.vimplug_exists.' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'wfxr/minimap.vim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

"           ----------------------
"           |   Plugins Config   |
"           ----------------------

" Color scheme
autocmd vimenter * ++nested colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
lua require'colorizer'.setup()

" Better Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" minimap.vim
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

"           -----------------------------
"           |   NeoVim Default Config   |
"           -----------------------------

:syntax on
:filetype plugin indent on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=.,~\AppData\Local\nvim-data\backup
set belloff=all
set nocompatible
set complete-=i
set cscopeverbose
set directory=~\AppData\Local\nvim-data\swap\\
set display=lastline,msgsep
set encoding=utf-8
"- 'fillchars' defaults (in effect) to "vert:│,fold:·,sep:│"
"- 'formatoptions' defaults to "tcqj"
set nofsync
set history=10000
set hlsearch
set incsearch
set langnoremap
set nolangremap
set laststatus=2
"set listchars=tab:> ,trail:-,nbsp:+
set nrformats=bin,hex
set ruler
"- 'sessionoptions' includes "unix,slash", excludes "options"
set shortmess+=F
set shortmess-=S
set showcmd
set sidescroll=1
set smarttab
set nostartofline
set tabpagemax=50
set tags=./tags;,tags
set ttimeoutlen=50
set ttyfast
"- 'viewoptions' includes "unix,slash"
set undodir=~\AppData\Local\nvim-data\undo
set viminfo+=!
set wildmenu
set wildoptions=pum,tagfile
"
"- |man.vim| plugin is enabled, so |:Man| is available by default.
"- |matchit| plugin is enabled. To disable it in your config:
"    :let loaded_matchit = 1
"
"- |g:vimsyn_embed| defaults to "l" to enable Lua highlighting

"           --------------
"           |   Config   |
"           --------------

" Maximum width of text that is being inserted.
set textwidth=80
" Highlight column after 'textwidth'
set colorcolumn=+1
" Highlight column after 'textwidth' in the help
autocmd FileType help setlocal colorcolumn=+2
" netrw - suppress the banner 
let g:netrw_banner=0
" netrw - tree style listing
let g:netrw_liststyle=3
" Set title to: filename [+=-] (path) - NVIM
set title
" Enable line number and relative line numbers
set number relativenumber
" Enable line number and relative line numbers in the help
autocmd FileType help setlocal number relativenumber
" Enable copy/paste
set clipboard^=unnamed,unnamedplus
" Disable mouse
set mouse=
" Hide mode since Airline handles this
set noshowmode
" To use Powershell (on Windows)
set shell=powershell shellpipe=\| shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8
" Enable auto completion
set wildmode=longest:list,full
" Finding files
set path+=**
" Ignoring case in a pattern
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

"           ----------------
"           |   Bindings   |
"           ----------------

" Leader key
"nnoremap <SPACE> <Nop>
"let mapleader = "\<Space>"
map <SPACE> <leader>

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

"           ----------------
"           |   Funtions   |
"           ----------------

"Examples:
":call Exec('buffers')
"This will include the output of :buffers into the current buffer.
"
"Also try:
":call Exec('ls')
":call Exec('autocmd')
"
funct! Exec(command)
    redir =>output
    silent exec a:command
    redir END
    let @o = output
    execute "put o"
    return ''
endfunct!
