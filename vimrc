" -- pathogen setup -- 
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" -- solarized --
" looks like iTerm does *not* need vim-colors-solarized 

" -- tabular --
map <C-T> :Tab /=<CR>  " Ctrl+T aligns to equal sign

" ---- vim ----
" -- tabs -- 
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set autoindent

" -- general --
set number            " show line numbers
set ruler             " show text coordinates on the status line
set wildmenu          " use horizontal wild menu for tab completion
set display+=lastline " do suppress long lines that don't fit
set backspace=2       " fixes occasional backspace issues on some systems
set hlsearch          " highlight search results
set scrolloff=10      " pad screen by 10 lines
set laststatus=2      " always show status line

" -- backup --
set nobackup
set nowritebackup
set noswapfile

" -- comment delimitation --
:ab %%% %----------------------------------
:ab /// //---------------------------------
:ab ### #----------------------------------

" -- color adjustments for solarized --
hi Search cterm=NONE ctermbg=LightRed
hi StatusLine cterm=NONE ctermbg=DarkBlue ctermfg=White
hi LineNr cterm=NONE ctermbg=None ctermfg=Magenta
hi Todo cterm=NONE ctermbg=None ctermbg=DarkBlue ctermfg=White

" -- python syntax hl fix --
let python_version_2 = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1

" -- ignore white space in vimdiff --
if &diff
  " diff mode
  set diffopt+=iwhite 
endif

" -- OSX system copy in visual mode --
vmap <C-c> "+y

" -- LaTeX -- 
function LatexTypeset ()
  :w
  let curr = @%
  let latexoutput=system("source ~/dotfiles/scripts/latex-typeset.sh ".curr)
  echo latexoutput
endfunction

function LatexPreprocess() 
  :w
  let curr = @%
  let latexoutput=system("source ~/dotfiles/scripts/latex-preprocess.sh ".curr)
  echo latexoutput
endfunction

command T call LatexTypeset()
command TT call LatexPreprocess()

" -- remaps --
inoremap jj <ESC>

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
