" -- pathogen setup -- 
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

let skip_defaults_vim=1
"set viminfo=""
"set viminfo="'100,<50,s10,h"

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

" -- do not jump to next match upon pressing *
nnoremap * m`:keepjumps normal! *``<cr>

" -- do not jump to a search result as the search query is being typed
set noincsearch

" -- backup --
set nobackup
set nowritebackup
set noswapfile

" -- comment delimitation --
:ab %%% %----------------------------------
:ab /// //---------------------------------
:ab ##### #----------------------------------

" -- color adjustments for solarized --
hi Search cterm=NONE ctermbg=LightRed
hi StatusLine cterm=NONE ctermbg=DarkBlue ctermfg=White
hi StatusLineNC cterm=NONE ctermbg=Cyan ctermfg=White
hi LineNr cterm=NONE ctermbg=None ctermfg=Magenta
hi Todo cterm=NONE ctermbg=None ctermbg=DarkBlue ctermfg=White
hi CursorLine   cterm=underline ctermfg=None
hi Pmenu ctermbg=LightGray ctermfg=None
hi PmenuSel ctermbg=LightGray ctermfg=DarkBlue
hi MatchParen cterm=bold ctermbg=LightRed ctermfg=red
hi VertSplit ctermbg=DarkBlue ctermfg=White
hi DiffChange cterm=None ctermbg=LightRed ctermfg=None
hi DiffDelete cterm=None ctermbg=LightRed ctermfg=White
hi DiffAdd cterm=None ctermbg=LightRed ctermfg=None
hi DiffText cterm=bold ctermbg=White ctermfg=DarkRed
" markdown's bold uses htmlItalic
hi htmlItalic cterm=None ctermbg=None ctermfg=DarkBlue
" latex's emph uses texItalStyle
hi texItalStyle cterm=None ctermbg=DarkBlue ctermfg=LightGray
set cursorline

" -- python syntax hl fix --
let python_version_2 = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1
au FileType python setlocal expandtab shiftwidth=2 tabstop=2

" -- R syntax -- 
autocmd BufNewFile,BufRead *.Rscript   set syntax=r
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

" -- ignore white space in vimdiff --
if &diff
  " diff mode
  set diffopt+=iwhite
endif
" -- always split diff windows vertically
set diffopt+=vertical

" -- OSX system copy in visual mode --
"vmap <C-c> "+y

" -- LaTeX -- 
function! LatexTypeset ()
  :w
  let curr = @%
  let latexoutput=system("source ~/dotfiles/scripts/latex-typeset.sh ".curr)
  echo latexoutput
endfunction

function! LatexPreprocess() 
  :w
  let curr = @%
  let latexoutput=system("source ~/dotfiles/scripts/latex-preprocess.sh ".curr)
  echo latexoutput
endfunction

command! T call LatexTypeset()
command! TT call LatexPreprocess()
command! C %!column -t
command! W %s/ \+$//g


" -- remaps --
inoremap jj <ESC>
inoremap kk <ESC>
inoremap <Tab> <C-x><C-f>

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

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

let mapleader=','
let NERDSpaceDelims=1

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=100

" disable autoincrement
map <C-a> <Nop>

" highlight extra task words in python
syn keyword pythonTodo contained NB NOTE

" Nvim-R
let R_assign=2
let R_assign_map="_"
let R_path="/software/R-3.3.1/bin"
let R_in_buffer=1
let r_indent_align_args = 0

" pbcopy
"let g:vim_pbcopy_local_cmd='cat > /dev/tcp/8733'
let g:vim_pbcopy_remote_cmd='cat > /dev/tcp/localhost/8377'

function! OpenManifest (path)
  " convert to absolute path
  let s:path = fnamemodify(a:path, ':p')
  " check if we reached root
  if s:path == "/"
    echo "manifest.txt not found"
    return
  endif
  " fname
  let s:fname = s:path . "/manifest.txt"
  if filereadable(s:fname)
    execute "vs " . s:fname
  else
    call OpenManifest(fnamemodify(s:path, ":h:h"))
  endif
endfunction
nnoremap <c-m> :call OpenManifest(".") <CR>

" ignore whitespace when diffing
set diffopt+=iwhite

cmap nots %s/[0-9]\{4,4\}-[0-9]\{2,2\}-[0-9]\{2,2\} [0-9]\{2,2\}:[0-9]\{2,2\}:[0-9]\{2,2\}\( PST\| PDT\)\?//g
set diffopt +=internal,algorithm:patience

" let g:context_border_char = '-'
