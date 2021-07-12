" This file can be loaded by calling `source init\plugins_config.vim` from your init.vim

" Automatically run :PackerCompile whenever plugins.lua is updated
autocmd BufWritePost plugins.lua PackerCompile

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
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
