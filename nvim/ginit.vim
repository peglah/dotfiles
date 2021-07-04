GuiFont Fira Mono for Powerline:h12:b

" Allows for font size to inc-/decrement and go back to normal.
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont Fira Mono for Powerline:h" . s:fontsize . ":b"
endfunction

function! NormalFontSize()
  let s:fontsize = 12
  :execute "GuiFont Fira Mono for Powerline:h" . s:fontsize . ":b"
endfunction
