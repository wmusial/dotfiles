" -- pathogen setup -- 
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" -- solarized --
" looks like iTerm does *not* need vim-colors-solarized 

" -- tabular --
map <C-T> :Tab /=<CR>  " Ctrl+T aligns to equal sign


