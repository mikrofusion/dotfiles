"""""""""""""""""""""""""""""""""""""""""
" settings (taken from janus core/before)
"""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/settings/autocmds.vim
source $HOME/.vim/settings/filetypes.vim
source $HOME/.vim/settings/gui_settings.vim
source $HOME/.vim/settings/mappings.vim
source $HOME/.vim/settings/settings.vim
source $HOME/.vim/settings/statusline.vim

"""" VUNDLE CONFIG (BEGIN) """"""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Color Theme
Bundle "jellybeans.vim"

" add vim snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Janus libraries
Bundle "ack"
" Bundle "before"
Bundle "buffergator"
Bundle "css-color"
Bundle "ctrlp"
Bundle "dispatch"
Bundle "easymotion"
Bundle "endwise"
Bundle "eunuch"
Bundle "fugitive"
Bundle "gist"
Bundle "gundo"
"Bundle "kwdb"
Bundle "matchit"
Bundle "multiple-cursors"
Bundle "narrowregion"
Bundle "nerdcommenter"
Bundle "nerdtree"
Bundle "repeat"
Bundle "supertab"
Bundle "syntastic"
Bundle "tagbar"
"Bundle "tasks"
Bundle "tlib"
Bundle "tlib_vim"

Bundle "unimpaired"
Bundle "vim-trailing-whitespace"
" Bundle "vim_test_runner"
Bundle "vimwiki"
Bundle "visualstar"
Bundle "vroom"
" Bundle "watchtower"
Bundle "webapi"
Bundle "zoomwin"




"Bundle 'ToadJamb/vim_test_runner'
" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" to run VUNDLE run :BundleInstall from the VIM command line.
"""" VUNDLE CONFIG (END) """"""""""""""""""""""""""""""""""""""""""""""""""






set term=screen-256color-bce

syntax on
set background=dark
set t_Co=256                        " force vim to use 256 colors
colorscheme jellybeans

let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" easier split navigation
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" use system keyboard
set clipboard=unnamed

" toggle search highlighting
"nnoremap <silent> <SPACE> :let @/ = ""
nnoremap <silent> <SPACE> :set hlsearch!<CR>

" make vim show relative numbers (disable since we use number_toggle)
" set relativenumber
source $HOME/.vim/number_toggle.vim

" dim inactive windows
source $HOME/.vim/diminactive.vim

" quicker ack access
nnoremap <leader>a :Ack

" remap jj to escape
inoremap jj <ESC>

" shortcuts for splitting the screen
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

" remove ability to use arrow keys (help force vim level up)
let g:arrowsenabled = 1

function! ArrowsOff()
  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>
  imap <up> <nop>
  imap <down> <nop>
  imap <left> <nop>
  imap <right> <nop>
endfunc

function! ArrowsOn()
  map <up> <up>
  map <down> <down>
  map <left> <left>
  map <right> <right>
  imap <up> <up>
  imap <down> <down>
  imap <left> <left>
  imap <right> <right>
endfunc

call ArrowsOff()

nnoremap <leader>k :call ArrowsOn() <CR>
nnoremap <leader>kk :call ArrowsOff() <CR>
