" This file can be loaded by calling `source init\functions.vim` from your init.vim

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
