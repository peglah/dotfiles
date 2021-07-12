" This file can be loaded by calling `source init\bindings.vim` from your init.vim

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
