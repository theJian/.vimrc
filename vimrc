"─── General ───────────────────────────────────────────────────────────────────
set nocompatible
syntax enable
filetype plugin indent on

" Indent
set autoindent
set cindent
set cinoptions+=J1

" Mouse
set mouse=nc

" Compatible options
set cpoptions+=n
set cpoptions+=y
set cpoptions-=;

" Tab
set softtabstop=4
set shiftwidth=4
set smarttab

" Open new splits on the right/bottom
set splitbelow
set splitright

" Encoding
set encoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

" Hide changed buffer instead close
set hidden

" Good performance
set lazyredraw
set ttyfast

" Hightlight BadWhitespace
highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*js,*jsx match BadWhitespace /\s\+$/

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Explore files case-insensitively
set wildignorecase

" Folding
set foldenable
set foldlevelstart=4
set foldnestmax=10
set foldopen-=block

" File format
set fileformat=unix

" Wrap long lines
set wrap 
set linebreak

" Better command line completion
set wildmenu

" No backup files, no swap files
set nobackup
set noswapfile

" Allow cursor to move just past the end of the line
set virtualedit=onemore

" Format options
"" 't': auto wrap text
"" 'B': do insert a whitespace when joining lines
"" 'j': remove comment leader when joining lines
set formatoptions+=tBj

" Make backspace work like most other programs
set backspace=2

"─── User Interface ────────────────────────────────────────────────────────────
" Colorscheme
set t_Co=256 " 256 colors
set background=dark
colorscheme fethoi

" True color
set termguicolors

" Show invisiable chars
set list
set listchars=tab:›\ ,trail:•,extends:§,nbsp:•

" Matches highlight delay
set showmatch
set matchtime=3

" Highlight font settings
highlight Comment cterm=italic

" Hightlight in diff
hi DiffAdd    cterm=bold
hi DiffDelete cterm=bold
hi DiffChange cterm=bold
hi DiffText   cterm=bold

" Font
set guifont=Inconsolata:h16

" Simplify Gvim window
set guioptions=av

" Statusline
set laststatus=2 " always show statusline
set statusline=%.42f " file path
set statusline+=%1*%m%*%r%h%w "file info
set statusline+=%= "switch to the right side
set statusline+=(%{&ff}/%Y) " file type
set statusline+=\  " separator
set statusline+=(line\ %l\/%L,\ col\ %c) " cusor position
set statusline+=\  " seperator
set statusline+=%<%P " percentage
" Highlight modified flag
highlight User1 ctermbg=1 guibg=#7c0615 guifg=White

" Change cursor shape in different mode(for VTE compatible terminals)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Mimium number of screen lines to keep above or below the cursor
set scrolloff=2

" Highlight cursor position
set cursorcolumn
set cursorline

" Use relative number
set number
set relativenumber

" Add a colored line at 81 column
set colorcolumn=81

" Solid window split border
set fillchars+=vert:\ 

" Dotted folded line
set fillchars+=fold:┄

" Wrapped line mark
set showbreak=↪\ \ \ 

" Show last command
set showcmd

" Show message in insert
set showmode

"─── Key Mapping ───────────────────────────────────────────────────────────────
" Set leader key
let mapleader="\<space>"

" Exit insert mode without esc
inoremap jk <ESC>

" Treat long lines as break lines
nnoremap <silent> j :<C-u>execute 'normal!' (v:count > 1 ? "m'" . v:count : 'g') . 'j'<CR>
nnoremap <silent> k :<C-u>execute 'normal!' (v:count > 1 ? "m'" . v:count : 'g') . 'k'<CR>

" Toggle folding
nnoremap <leader><space> za

" To save, press <leader>w
nnoremap <leader>w :w<CR>

" To edit, press <leader>e
nnoremap <leader>e :e <C-R>=expand("%:h") . "/" <CR>

" To create a file
nnoremap <leader>n :n <C-R>=expand("%:h") . "/" <CR>

" Add an empty line without insert mode(for GUI)
nnoremap <C-CR> o<Esc>
nnoremap <S-CR> O<Esc>

" Add an empty line in insert mode(for GUI)
inoremap <C-CR> <Esc>o
inoremap <S-CR> <Esc>O

" Split
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <leader>t :tabnew<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Copy/Paste/Cut
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
vnoremap <leader>x "+x
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Close buffer
nnoremap <leader>q :<C-u>bp\|bd #<CR>

" Clean search (highlight)
nnoremap <silent> <BS> :noh<CR>

" Switching windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-q> <C-w>q

" shifting
vnoremap < <gv
vnoremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Uppercase/Lowercase word
inoremap <C-u> <C-y><esc>g~iwea

" Select last changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Command line editing
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Open files fuzzyfinder
nnoremap <leader>f :FFiles<CR>

"─── User Scripts ──────────────────────────────────────────────────────────────
" Automatically equalize splits when Vim is resized
augroup Resize
    autocmd!
    autocmd VimResized * wincmd =
augroup END

" Only have cursorline in current window
augroup CursorLine
    autocmd!
    autocmd winleave * set nocursorline
    autocmd winleave * set nocursorcolumn
    autocmd winenter * set cursorline
    autocmd winenter * set cursorcolumn
augroup END

" Automatic create directory when it doesn't exist
augroup Mkdir
    autocmd!
    autocmd BufNewFile *
                \ if !isdirectory(expand("<afile>:p:h")) |
                \ call mkdir(expand("<afile>:p:h"), "p") |
                \ endif
augroup END

" Open help file in new tab
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

" Only apply to help files
function! HelpInNewTab()
    if &buftype == 'help'
        " convert help window to tab
        execute "normal! \<C-W>T"
    endif
endfunction

" Show syntax highlighting groups for word under cursor
nnoremap <leader><C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"─── Plugin Settings ───────────────────────────────────────────────────────────

if exists('*minpac#init')
    call minpac#init({ 'package_name': 'x' })

    " start
    call minpac#add('editorconfig/editorconfig-vim')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('Raimondi/delimitMate')
    call minpac#add('SirVer/ultisnips')
    call minpac#add('vim-scripts/YankRing.vim')
    call minpac#add('Valloric/YouCompleteMe')
    call minpac#add('vim-scripts/SearchComplete')
    call minpac#add('wellle/targets.vim')
    call minpac#add('terryma/vim-expand-region')
    call minpac#add('theJian/fit')

    " opt
    function! AddOpt(url, ...)
        let opt = get(a:, 1, {})
        call minpac#add(a:url, extend({ 'type': 'opt' }, opt))
    endfunction
    call AddOpt('reasonml-editor/vim-reason-plus')
    call AddOpt('theJian/vim-fethoi')
endif

" complete
" set completefunc=LanguageClient#complete
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Netrw
let g:netrw_liststyle=0
let g:netrw_keepdir=1

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" fit
let g:FitFilesFindCommand = "rg --color never --files <dir>"
let g:FitMatchCommand = "fzy --show-matches=<query>"

" lsp
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ }
