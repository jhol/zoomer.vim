if &cp || exists("g:zoomer_loaded")
    finish
endif

let g:zoomer_loaded = 1

if ! exists('g:zoomer_amount')
  " number of points to increment or decrement font size by
  let g:zoomer_amount = 1
endif

let s:save_cpo = &cpo
set cpo&vim

" keep default value
let s:current_font = &guifont

" command
command! -nargs=? ZoomIn   :call s:ZoomIn(<args>)
command! -nargs=? ZoomOut  :call s:ZoomOut(<args>)
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap + :ZoomIn<CR>
nmap - :ZoomOut<CR>

" increase font size
function! s:ZoomIn(...)
  let l:fsize = str2float(substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', ''))
  let l:fsize += get(a:, 1, g:zoomer_amount)
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . string(l:fsize), '')
  let &guifont = l:guifont
endfunction

" decrease font size
function! s:ZoomOut(...)
  ZoomIn(-get(a:, 1, g:zoomer_amount))
endfunction

" reset guifont size
function! s:ZoomReset()
  let &guifont = s:current_font
endfunction

let &cpo = s:save_cpo
