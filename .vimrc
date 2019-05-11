syntax on
colorscheme javipolo 

set nocompatible              " required
filetype off                  " required

set nobackup          " don't make automatic backups
set incsearch         " incremental searching
set ignorecase        " case insensitive matching
set smartcase         " smart case matching
set visualbell        " replace beeping with flashing screen

" Set encoding
" ============
set encoding=utf-8

" For splits 
" ==========
set splitbelow
set splitright

" Find files recursively and with tabs
set path+=**
set wildmenu

" movement with CTRL and hjkl keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Continue search from top after finished.
set wrapscan

" Enable folding (using space)
" ============================
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" For Vandle - plugin manager for vim
" ====================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Python indent
" =============
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag whitespace
" ===============
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Run python code with F9
" =======================
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

let python_highlight_all=1
syntax on

