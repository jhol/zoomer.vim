let s:save_cpo = &cpo
set cpo&vim

if ! exists('g:zoomer_amount')
  " number of points to increment or decrement font size by
  let g:zoomer_amount = 1
endif

if ! exists('g:zoomer_min_size')
  " minimum font size in points
  let g:zoomer_min_size = 1.0
endif

if ! exists('g:zoomer_max_size')
  " maximum font size in points
  let g:zoomer_max_size = 1000.0
endif

" command
command! -nargs=? ZoomIn   :call zoomer#ZoomIn(<args>)
command! -nargs=? ZoomOut  :call zoomer#ZoomOut(<args>)
command! -narg=0 ZoomReset :call zoomer#ZoomReset()

let &cpo = s:save_cpo
