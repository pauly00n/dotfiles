" OLD VIMSCRIPT CONFIG, SWITCHED EVERYTHING TO LUA

" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent expandtab tabstop=4 shiftwidth=4 " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number relativenumber" Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
"set cc=220 " Show at 80 column a border for good code style but I don't like it
let g:vimtex_view_method = 'zathura' "set that shit to zathura
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax enable
set incsearch " Enable incremental search 
"set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set nocompatible 
let mapleader = " "
nnoremap <leader>v :exe 'edit' stdpath('config').'/init.vim'<CR>

" plugins for neovim
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'tomasiser/vim-code-dark' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MunifTanjim/nui.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'sirver/ultisnips'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" color scheme for code dark-> fix the hidden latex elements issue 
colorscheme codedark 
hi! clear Conceal
hi! link EndOfBuffer Ignore

" airline config
let g:bargreybars_auto=0
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" Vimtex options
let g:tex_conceal='mgs'
let g:tex_fast= ""
let g:vimtex_matchparen_enabled = 0
let loaded_matchparen = 1
let g:vimtex_delim_stopline = 0
set conceallevel=1 " Sets the thing concealment for LaTeX

" Ultisnips config
let g:UltiSnipsExpandTrigger = '<tab>' 
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" some remap for coc?? i think
    nnoremap <silent> K :call <sid>show_documentation()<cr>
    function! s:show_documentation()
      if index(['vim', 'help'], &filetype) >= 0
        execute 'help ' . expand('<cword>')
      elseif &filetype ==# 'tex'
        VimtexDocPackage
      else
        call CocAction('doHover')
      endif
    endfunction	
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" customization options for quickfix 
let g:vimtex_quickfix_open_on_warning = 0  
" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \ 'LaTeX Font Warning'
      \]

" nerdtree options
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim maximizer remap
nnoremap <leader>m :MaximizerToggle!<CR>

" neoterm setup
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" neotree 
nnoremap <leader>n :Neotree filesystem reveal left<CR>

