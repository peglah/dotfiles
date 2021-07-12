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

"- |man.vim| plugin is enabled, so |:Man| is available by default.
"- |matchit| plugin is enabled. To disable it in your config:
"    :let loaded_matchit = 1

"- |g:vimsyn_embed| defaults to "l" to enable Lua highlighting
