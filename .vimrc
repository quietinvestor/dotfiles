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

" Catppuccin theme.
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Initialize plugin system
call plug#end()

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
autocmd vimenter * colorscheme catppuccin_mocha
