" Filetype recognition via plugin stored in
" $VIMRUNTIME/after/ftplugin/<filetype>.vim
" Filetype indent rules via indent file stored in
" $VIMRUNTIME/after/indent/<filetype>.vim
filetype plugin indent on

" Add line numbers.
set number

" Use spaces for tabs
set expandtab

" Highlight active line.
set cursorline

" Show last command entered in bottom right.
set showcmd

" Enable graphical autocomplete menu when using <TAB>.
set wildmenu

" Highlight matching parenthesis when hovering over
" with cursor.
set showmatch

" Search for characters as they are entered after / or ?
set incsearch

" Highlight search results.
set hlsearch

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Gruvbox theme.
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Most terminals don't handle italics right so gruvbox disables italics for
" terminals by default. But if you're using urxvt or gnome-terminal you
" should try setting let g:gruvbox_italic=1 before colorscheme gruvbox to
" enforce displaying italics.  
let g:gruvbox_italic=1

" Colour fix for termguicolors to work in tmux.
" See :h xterm-true-color for details.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" By default gruvbox will act as usual 256-color theme, but colors wouldn't
" be that vivid due to limitations of 256-palette. Neovim and recent Vim
" support true color terminal out of the box with just a single
" configuration option. No workarounds anymore. Just add set termguicolors
" to your $MYVIMRC.
set termguicolors

" Load gruvbox theme.
autocmd vimenter * colorscheme gruvbox

" Set dark gruvbox theme.
set background=dark
