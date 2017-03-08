" -- pathogen setup -- 
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" -- solarized --
" looks like iTerm does *not* need vim-colors-solarized 

" -- tabular --
map <C-T> :Tab /=<CR>  " Ctrl+T aligns to equal sign

" ---- vim ----
" -- tabs -- 
set expandtab
set tabstop=2
set shiftwidth=2
set cindent
set autoindent

set nowrap

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
hi CursorLine   cterm=NONE ctermbg=lightgray
hi Pmenu ctermbg=LightGray ctermfg=None
hi PmenuSel ctermbg=LightGray ctermfg=DarkBlue
hi MatchParen cterm=bold ctermbg=white ctermfg=red
set cursorline

" -- python syntax hl fix --
let python_version_2 = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1

" -- R syntax -- 
autocmd BufNewFile,BufRead *.Rscript   set syntax=r

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
command C %!column -t

" -- remaps --
inoremap jj <ESC>

" disable arrow keys

" enable jk in popup menus
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ~/'
let g:ctrlp_follow_symlinks = 1

" sudo write
cmap w!! w !sudo tee > /dev/null %

" flake 8
let g:flake8_show_in_file=1
highlight link Flake8_Warning Search
highlight link Flake8_Error Search

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

let mapleader=','
let NERDSpaceDelims=1

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

" disable autoincrement
map <C-a> <Nop>

" highlight extra task words in python
syn keyword pythonTodo contained NB NOTE

" Nvim-R
let R_assign=2
let R_assign_map="_"
