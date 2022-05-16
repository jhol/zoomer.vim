if &cp || exists("g:loaded_zoom")
    finish
endif

let g:loaded_zoom = 1

if ! exists('g:zoom_amount')
  " number of points to increment or decrement font size by
  let g:zoom_amount = 1
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
  let l:fsize += get(a:, 1, g:zoom_amount)
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . string(l:fsize), '')
  let &guifont = l:guifont
endfunction

" decrease font size
function! s:ZoomOut(...)
  ZoomIn(-get(a:, 1, g:zoom_amount))
endfunction

" reset guifont size
function! s:ZoomReset()
  let &guifont = s:current_font
endfunction

let &cpo = s:save_cpo
finish

==============================================================================
zoom.vim : control gui font size with "+" or "-" keys.
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/zoom.vim
==============================================================================
author  : OMI TAKU
url     : http://nanasi.jp/
email   : mail@nanasi.jp
version : 2008/07/18 10:00:00
==============================================================================

Control Vim editor font size with key "+", or key "-".
Press "+" key, Vim editor gui font size will change bigger.
And, press "-" key, Vim editor gui font size will change smaller.

This plugin is for GUI only.


Normal Mode:
    +                  ... change font size bigger
    -                  ... change font size smaller

Command-line Mode:
    :ZoomIn            ... change font size bigger
    :ZoomOut           ... change font size smaller
    :ZoomReset         ... reset font size changes.

==============================================================================

1. Copy the zoom.vim script to
   $HOME/vimfiles/plugin or $HOME/.vim/plugin directory.
   Refer to ':help add-plugin', ':help add-global-plugin' and
   ':help runtimepath' for more details about Vim plugins.

2. Restart Vim.

==============================================================================
" vim: set ff=unix et ft=vim nowrap :
