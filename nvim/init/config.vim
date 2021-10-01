" This file can be loaded by calling `source init\config.vim` from your init.vim

" Force language to english
  language en_US

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
  set textwidth=80
" Highlight column after 'textwidth'
  set colorcolumn=+1
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
