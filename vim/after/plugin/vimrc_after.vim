" This loads after the gzn plugins so that plugin mappings can
" be overwritten.

if filereadable(expand("~/.gzn/vim/after/.vimrc.after"))
  source ~/.gzn/vim/after/.vimrc.after
endif

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
