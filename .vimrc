"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/jian/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/jian/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-commentary'
NeoBundle 'jiangmiao/auto-pairs'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"""""""""""""""""""""""""""""""""""""""""""""""
"                   General                   "
"""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
syntax on
set smartindent

" tab
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" encoding
set encoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

" Good performance
set lazyredraw
set ttyfast

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Fold
set foldmethod=indent
set nofoldenable

set bs=2
set wrapmargin=8
set ruler
set wildmenu
set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""
"               User Interface                "
"""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
if has("gui_running")
    colorscheme gotham
else
    colorscheme base16-greenscreen
endif

"Font
set gfn=Hack\ 10

"Simplify Gvim window
set guioptions=av

"Statusline
set laststatus=2
hi statusline ctermbg=0
set statusline=#%-3.3n\%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %<%P

"Cursor
set guicursor+=a:blinkon0
set scrolloff=3
set cursorline
set cursorcolumn

set number
set showcmd
set showmode
set showmatch
set showbreak=>\ 

"""""""""""""""""""""""""""""""""""""""""""""""
"                Key Mapping                  "
"""""""""""""""""""""""""""""""""""""""""""""""
" set leader key
let mapleader="\<space>"

" Treat long lines as break lines
map j gj
map k gk

" To save, press <leader>w
nmap <leader>w :w<CR>

" To edit, press <leader>e
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" To edit in a new tab, press <leader>te
noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Add an empty line without insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" Tabs
nnoremap <C-S-Tab> gT
nnoremap <C-Tab> gt
nnoremap <silent> <C-t> :tabnew<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" Buffer nav
noremap <leader>[ :bp<CR>
noremap <leader>] :bn<CR>

" Close buffer
noremap <leader>\ :bd<CR>

" Clean search (highlight)
nnoremap <silent> <leader><BS> :noh<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" shifting
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
