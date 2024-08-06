set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()

" Styling Stuff
Plug 'ap/vim-css-color'
Plug 'felixhummel/setcolors.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Coding Stuff
Plug 'airblade/vim-gitgutter' " Show changed lines in gutter
Plug 'jiangmiao/auto-pairs'   " Auto insert closing brackets/braces/etc.
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'       " Fuzzy File Finder (ctrl-p)
Plug 'mileszs/ack.vim'        " Search
Plug 'tpope/vim-unimpaired'   " Navigation between buffers
Plug 'dense-analysis/ale'     " Async linting

" Syntax Stuff
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'mustache/vim-mustache-handlebars'

" Ctrl-P
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Writing Stuff
Plug 'folke/zen-mode.nvim'

call plug#end()

if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
if !has('nvim')
  source $VIMRUNTIME/defaults.vim
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'markdown': ['write-good']
\}

" Open Quickfix
nnoremap <C-c> :copen<CR>

" Setup ack to use rg for searching
let g:ackprg = 'rg --color=never --no-heading --with-filename --line-number --column'
let g:ack_autoclose = 1

cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

" Map CTRL-P To Telescope
nnoremap <C-p> :Telescope find_files<CR>

" New splits go right
set splitright

" Tabs to Spaces (4 lyfe)
set tabstop=2 shiftwidth=2 expandtab

" Keep buffers open in background
set hidden

" Show trailing space after line
set list lcs=trail:·,tab:»·

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/*,*/public/js/_*

" OmniComplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

colorscheme tender

set termguicolors

" Transparent Background
hi Normal guibg=NONE ctermbg=NONE

" Backup file location
set backupdir=~/.tmp

" No Undo Files
set noundofile

" Fuzzy File Search
set rtp+=~/.fzf

set encoding=utf-8

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

" Only show filename for buffers
let g:airline#extensions#tabline#fnamemod = ':t'

" Hybrid line numbers
set number relativenumber
set nu rnu

" Rust
let g:rustfmt_autosave = 1
