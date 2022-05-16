
function! s:zoomerInit()
  if !exists("s:zoomer_initialized")
    let s:zoomer_initialized = 1
    let s:current_font = &guifont
  endif
endfunction

" clamp a float between limits
function! s:clamp(x, lo, hi)
  if a:x < a:lo
    return lo
  elseif a:x > a:hi
    return a:hi
  else
    return a:x
  endif
endfunction

" increase font size
function! zoomer#ZoomIn(...)
  call s:zoomerInit()
  let l:fsize = str2float(substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', ''))
  let l:fsize += get(a:, 1, g:zoomer_amount)
  let l:fsize = s:clamp(l:fsize, g:zoomer_min_size, g:zoomer_max_size)
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . string(l:fsize), '')
  let &guifont = l:guifont
endfunction

" decrease font size
function! zoomer#ZoomOut(...)
  ZoomIn(-get(a:, 1, g:zoomer_amount))
endfunction

" reset guifont size
function! zoomer#ZoomReset()
  call s:zoomerInit()
  let &guifont = s:current_font
endfunction
