GuiFont FiraMono NF:h12:b
GuiTabline 0

" Allows for font size to inc-/decrement and go back to normal
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont FiraMono NF:h" . s:fontsize . ":b"
endfunction

function! NormalFontSize()
  let s:fontsize = 12
  :execute "GuiFont FiraMono NF:h" . s:fontsize . ":b"
endfunction
