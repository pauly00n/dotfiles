set nocompatible

set clipboard=unnamedplus
filetype plugin indent on
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
set cursorline             " Find the current line quickly.
set shiftround
set number
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

" REMAPS ------

" CMD enter command mode
nnoremap ; :

" Search within file easier
nnoremap <leader>ii /

" Clear search highlight
nnoremap <ESC> :nohlsearch<CR>

" Scroll on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Switch windows easier
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

" Line start/end shortcuts
nnoremap E $
nnoremap B ^
vnoremap E $
vnoremap B ^
