" vim-devicons
" Set encoding to UTF-8 to show glyphs
set encoding=utf8

" Add line numbers.
set number

" Use spaces for tabs
set expandtab

" Syntax highlighting
syntax on

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

" NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-a> :NERDTree<CR>
nnoremap <C-s> :NERDTreeToggle<CR>
nnoremap <C-d> :NERDTreeFind<CR>

" FZF
" Default FZF layout
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" FZF key mappings
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>


" By default catppuccin will act as usual 256-color theme, but colors wouldn't
" be that vivid due to limitations of 256-palette. Neovim and recent Vim
" support true color terminal out of the box with just a single
" configuration option. No workarounds anymore. Just add set termguicolors
" to your $MYVIMRC.
set termguicolors

" Colour fix for termguicolors to work in tmux.
" See :h xterm-true-color for details.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Enable lightline
let g:lightline = { 'colorscheme': 'catppuccinLightline' }
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set laststatus=2

" Load catppuccin mocha theme.
colorscheme catppuccin

" vim-devicons
set guifont=DroidSansMono\ Nerd\ Font\ 12
