if exists("b:did_ftplugin_after")
  finish
endif
let b:did_ftplugin_after = 1

setlocal lisp autoindent showmatch cpoptions-=mp

" possible folding method
setlocal foldmethod=marker foldmarker=(,) foldminlines=1

" this allows gf and :find to work. Fix path to your needs
setlocal suffixesadd=.lisp

packadd rainbow_parentheses.vim
" packadd vim-parinfer
packadd vim-sexp

execute 'RainbowParentheses'