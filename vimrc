"""""""""""""""""""""""""""""""""""""""""
" janus settings (taken from janus core/before)
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
Bundle "nanotech/jellybeans.vim"

" add vim snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Add number toggle (relative)
Bundle "jeffkreeftmeijer/vim-numbertoggle"

" vim livescript plugin
Bundle "gkz/vim-ls"

" Add rspec runner
"Bundle 'thoughtbot/vim-rspec'
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>
"let g:rspec_command = "!bundle exec rspec"

" Language support
Bundle "tpope/vim-rails"
Bundle "vim-ruby/vim-ruby"
Bundle "pangloss/vim-javascript"
"Bundle "skwp/vim-rspec"
Bundle "sunaku/vim-ruby-minitest"
Bundle "tpope/vim-markdown"
Bundle "cakebaker/scss-syntax.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "chrisbra/csv.vim"
Bundle "tpope/vim-git"

" allow seamless TMUX / VIM integration
Bundle 'christoomey/vim-tmux-navigator'

" Janus libraries
Bundle "petdance/ack2"
Bundle "jeetsukumaran/vim-buffergator"
Bundle "ap/vim-css-color"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-endwise"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle "mattn/gist-vim"
Bundle "sjl/gundo.vim"
Bundle "rgarver/Kwbd.vim"
Bundle "edsono/vim-matchit"
Bundle "terryma/vim-multiple-cursors"
Bundle "chrisbra/NrrwRgn"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-repeat"
Bundle "ervandew/supertab"
Bundle "tpope/vim-surround"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "tpope/vim-unimpaired"
Bundle "bronson/vim-trailing-whitespace"
Bundle "vim-scripts/vimwiki"
Bundle "thinca/vim-visualstar"
Bundle "skalnik/vim-vroom"
Bundle "mattn/webapi-vim"

Bundle "itspriddle/ZoomWin"
filetype plugin indent on     " required

" set vim root to the project root
Bundle "airblade/vim-rooter"

" Add vim test runner
Bundle "ToadJamb/vim_test_runner"

" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" to run VUNDLE run :BundleInstall from the VIM command line.
"""" VUNDLE CONFIG (END) """"""""""""""""""""""""""""""""""""""""""""""""""

" Add vim test runner
map <silent> <leader>rt :call tt:TriggerTest()<CR>
map <silent> <leader>r :call tt:TriggerPreviousTest()<CR>

set term=screen-256color-bce

syntax on
set ruler
set background=dark
set t_Co=256                        " force vim to use 256 colors
colorscheme jellybeans

" highlight the active line
set cursorline
hi CursorLine cterm=underline ctermbg=NONE

set tabstop=2
set shiftwidth=2
set expandtab ts=2 sw=2 ai

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Dim inactive windows, highlight line 80 for active window.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * let &colorcolumn=join(range(81,999),",")
    autocmd WinLeave * let &colorcolumn=join(range(1,999),",")
augroup END
"
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
