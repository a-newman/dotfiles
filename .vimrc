set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" adds the column to the left that tells you the status of that line in git 
Plugin 'airblade/vim-gitgutter'

" Pretty theme 
Plugin 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" gives you indent guides 
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3 
let g:indent_guides_enable_on_vim_startup = 1

" Plugin to let you write plain text wo lines and stuff 
Plugin 'junegunn/goyo.vim'

" Autocomplete plugin 
Plugin 'valloric/youcompleteme'
set completeopt-=preview
" enable semantic autocompletion for python
let g:ycm_semantic_triggers = {
    \   'python': [ 're!\w{2}' ],
    \   'javascript': [ 're!\w{2}' ],
    \ }

" JSX indentation and syntax highlighting
Plugin 'maxmellon/vim-jsx-pretty'

" Automatic quotes/bracket pairing
Plugin 'tmsvg/pear-tree'
" more intuitive bracket pairing; see the README https://github.com/tmsvg/pear-tree
let g:pear_tree_repeatable_expand = 0 

" More powerful commands for bracket/tag editing
" See tutorial: http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/
Plugin 'tpope/vim-surround'

" Lets you easily select an indented block (like a function)
Plugin 'michaeljsmith/vim-indent-object'

" API for linters, fixers, etc in lots of languages
" Installing for Python linting
Plugin 'dense-analysis/ale'
let g:ale_linters={
    \'python': ['flake8']
\}
let g:ale_fixers={
    \'python': ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'yapf', 'isort']
\}
let g:ale_fix_on_save=1

" Automatic commenting/uncommenting
Plugin 'tpope/vim-commentary'

" Directory structure in vim 
Plugin 'preservim/nerdtree'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" turns on syntax highlighting for latex-style math expressions
let g:vim_markdown_math = 1 
" support from yaml front matter (like that used for gatsby)
let g:vim_markdown_frontmatter = 1
" disable folding
" let g:vim_markdown_folding_disabled = 1


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ================ Custom config ============================================
inoremap jk <Esc>
syntax on

set softtabstop=4 shiftwidth=4 expandtab
retab

set number

set ignorecase
set smartcase

command PPjson execute '%!python -m json.tool' 
command PPcsv execute "%!column -s ',' -t"
"command PPcsv execute "%!sed 's/,/,|/g' | column -s '|' -t"
command Pdf execute '!pdflatex %'
command Py execute 'w !python3'
command Typora execute 'silent !typora % &'

" set a column at the right spot for a python file
autocmd BufNewFile,BufRead *.py set colorcolumn=80
" set nowrap on csv files
autocmd BufNewFile,BufRead *.csv set nowrap | silent PPcsv
autocmd BufNewFile,BufRead *.json silent PPjson
" change the tab length for a js/html file
autocmd BufNewFile,BufRead *.js,*.html set softtabstop=2 shiftwidth=2

set t_Co=256
colo challenger_deep

set scrolloff=10
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" Increase copy/paste buffer size 
set viminfo='20,<1000

" Treat underscore as space for purpose of ciw
set iskeyword-=_
