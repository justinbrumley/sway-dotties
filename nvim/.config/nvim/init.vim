set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'felixhummel/setcolors.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'mustache/vim-mustache-handlebars'

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

" Open Quickfix
nnoremap <C-c> :copen<CR>

" Setup ack to use rg for searching
let g:ackprg = 'rg --color=never --no-heading --with-filename --line-number --column'
let g:ack_autoclose = 1

cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

" Map CTRL-P To FZF
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files'

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

" Syntastic config for linting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "active" }
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_typescript_checkers = ['eslint']

" Rust
let g:rustfmt_autosave = 1
