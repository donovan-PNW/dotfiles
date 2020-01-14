set nocompatible
set nornu
set nu
set autoindent
set showmode
set noerrorbells
set colorcolumn=100
"set tw=99
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set wrap
set wildmode=longest,list,full
set wildmenu
set hlsearch
set ttyfast
set bg=dark
set incsearch
set history=1000
set undolevels=1000
set pastetoggle=<F2>
"set mouse=r 
set mouse=a 
set hidden
set foldmethod=manual
set hidden
set viminfo='1000,f1
set splitbelow
set splitright
set conceallevel=0
set backspace=indent,eol,start
"fzf told me to include this one
set rtp+=/usr/local/opt/fzf
set clipboard=unnamed

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>


if has('nvim') || has('termguicolors')
  set termguicolors
endif


"mappings!!
map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
"gruvbox
Plug 'morhetz/gruvbox'
"badwolf
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'
"" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
"Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'nanotech/jellybeans.vim'
Plug 'severin-lemaignan/vim-minimap'
" BAD Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'
" Plug 'sheerun/vim-polyglot'
Plug 'simnalamburt/vim-mundo'
Plug 'tmux-plugins/vim-tmux'
Plug 'jaredgorski/spacecamp'
Plug 'whatyouhide/vim-gotham'
Plug 'rafalbromirski/vim-aurora'
Plug 'altercation/vim-colors-solarized'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'itchyny/vim-gitbranch'


" Plugin options
"Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

call plug#end()
let g:ale_linters = { 'python': ['flake8'] }

"closes if nerdtree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:gruvbox_contrast_dark = "hard"
"colorscheme gotham
"colorscheme gruvbox 
syntax enable
colorscheme challenger_deep
set background=dark
"let g:seoul256_background = 235
"colorscheme seoul256
let g:minimap_highlight='Visual'
let g:airline_theme='hybridline'
let g:prettier#quickfix_enabled = 0
let g:ale_set_highlights = 0
let g:prettier#autoformat = 0
"autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 sw=2 expandtab
" autocmd FileType html,css setlocal tabstop=2 softtabstop=2 sw=2 expandtab
au BufNewFile,BufRead *.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
