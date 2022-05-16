zoomer.vim
==========

`zoomer.vim` is a forked version of
[zoom.vim](https://github.com/vim-scripts/zoom.vim) - a GUI-only vim plugin
that enables the user to quickly increase or decrease the font size. This fork
make various improvements over the original including the following:

  * Makes zoom amount configurable as command and function arguments, and as a
    global variable `g:zoom_amount`
  * Fractional values are supported

Installation
------------

To install `zoomer.vim` use your plugin manager of choice, for example:

```
Plug 'jhol/zoomer.vim'
```

Usage
-----

### Commands

  * `:ZoomIn [amount]` - Increate font size, where `amount` is an optional
    integer or float value to indicate the number of points to increase the
    font size.
  * `:ZoomOut [amount]` - Decreate font size.
  * `:ZoomReset` - Reset font size.

### Variables

  * `g:zoomer_amount` is the default increment or decrement that is applied to
    the font size. The value may be an integer or float that indicate the
    number of points to increase the font size.