if $SHELL =~ 'fish'
set shell='/bin/bash'
endif

set backupdir=~/.vim/bkup               " Directories for bkup files
set directory=~/.vim/bkup               " Directories for swp files

set encoding=utf-8                      " The encoding displayed.
set fileencoding=utf-8                  " The encoding written to file.

set nocompatible                        " be iMproved, required for Vundle
filetype off                            " required for Vundle

" prevent going into Ex mode
map Q <Nop>

" Disable CAPS LOCK
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" for c in range(char2nr('A'), char2nr('Z'))
"  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
"  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
" endfor

" Kill the capslock when leaving insert mode.
" autocmd InsertLeave * set iminsert=0

" set runtime path for Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
" intialize Vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" color theme
Plugin 'nanotech/jellybeans.vim'

" add vim snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Add number toggle (relative)
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
set relativenumber
set number

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <silent> <leader><SPACE> :call NumberToggle()<cr>

" vimux (VIM TMUX integration)
Plugin 'benmills/vimux'
" Add vim test runner
" Plugin 'ToadJamb/vim_test_runner'

" vim test runner keys
map <silent> <leader>t :call tt:TriggerTest()<CR>
map <silent> <leader>r :call tt:TriggerPreviousTest()<CR>

" Language support
" livescript
Plugin 'gkz/vim-ls'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tpope/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-git'
Plugin 'slim-template/vim-slim'

" allow seamless TMUX / VIM integration
Plugin 'christoomey/vim-tmux-navigator'

" allow git changes to be seen in gutter
Plugin 'airblade/vim-gitgutter'

" ag the silver searcher
Plugin 'rking/ag.vim'

" show buffers
Plugin 'jeetsukumaran/vim-buffergator'

" use unimpaired for buffer switching [-b and ]-b
" also used for line bubbling
Plugin 'tpope/vim-unimpaired'

" file files, CTRLP mapped to F
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

" Janus libraries
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'
Plugin 'sjl/gundo.vim'
Plugin 'edsono/vim-matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chrisbra/NrrwRgn'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/vimwiki'
Plugin 'thinca/vim-visualstar'
Plugin 'skalnik/vim-vroom'
Plugin 'mattn/webapi-vim'

" Zoom in and out of current pane (C-W, O)
Plugin 'itspriddle/ZoomWin'

" set vim root to the project root
Plugin 'airblade/vim-rooter'

" vim airline (powerline-like theme)
Plugin 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1    " add buffer tabs to top
let g:airline#extensions#tabline#enabled = 1
"
" plugin to create airline theme for tmux
Plugin 'edkolev/tmuxline.vim'
let g:airline_powerline_fonts = 1               " needed for powerline symbols

" visualization of vim markers
Plugin 'kshenoy/vim-signature'

call vundle#end()
filetype plugin indent on

set term=screen-256color-bce

syntax on
set number
set ruler
set background=dark
set t_Co=256                        " foce vim to use 256 colors
colorscheme jellybeans              " user jellybeans scheme

" make the colors pretty
highlight Normal ctermbg=none
highlight CursorLineNr ctermbg=233
highlight LineNr ctermbg=232
" Gitgutter
highlight SignColumn ctermbg=none

" Spacing
set wm=0
set tw=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab ts=2 sw=2 ai
set autoindent
set smartindent

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" causes errors when not running in TMUX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"
" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0

" Show trailing whitespace
set list listchars=tab:\ \ ,trail:.

" Bubble lines
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv


" Searching
set hlsearch
set incsearch
set ignorecase

set nowrap

" always show the status bar (want this for airline)
set laststatus=2

" highlight the active line
set cursorline
hi CursorLine cterm=underline ctermbg=NONE

" make make grey after line 80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=232 guibg=#202020

" Dim inactive windows, highlight line 80 for active window.
"augroup BgHighlight
    "autocmd!
    "autocmd WinEnter * let &colorcolumn=join(range(81,999),",")
    "autocmd WinLeave * let &colorcolumn=join(range(1,999),",")
"augroup END

" only show highlighted line in active pane
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
"
" remap jj to escape
inoremap jj <esc>

" open when vim starts
"autocmd vimenter * NERDTree

" NERDTree 
map <leader>n :NERDTreeToggle<CR>

" open automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close wim if only window left open is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif





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

" quicker ag access
nnoremap <leader>a :Ag

" shortcuts for splitting the screen
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

" window resizing
"if bufwinnr(1)
  "map + <C-W>+
  "map _ <C-W>-
  "map > <C-W><
  "map < <C-W>>
"endif


" allows switching between unsaved buffers
" set hidden

" remove ability to use arrow keys (help force vim level up)
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
"call ArrowsOff()

" sytax highlighting for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

nnoremap <leader>k :call ArrowsOn() <CR>

filetype plugin indent on                        " required for Vundle

" VIMUX
 " Run the current file with rspec
 map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

 " Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>

 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>

 " Inspect runner pane
 map <Leader>vi :VimuxInspectRunner<CR>

 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

 " Interrupt any command running in the runner pane
 map <Leader>vx :VimuxInterruptRunner<CR>

 " Zoom the runner pane (use <bind-key> z to restore runner pane)
 map <Leader>vz :call VimuxZoomRunner()<CR>


 "
 "
 "
 "
 "
"runtime! after/**/*.vim
"
"
"
"
"
"
"
"
"
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc graveyard (below are items no longer being used)
"
  "" Map command-[ and command-] to indenting or outdenting
  "" while keeping the original selection in visual mode
  "vmap <D-]> >gv
  "vmap <D-[> <gv

  "nmap <D-]> >>
  "nmap <D-[> <<

  "omap <D-]> >>
  "omap <D-[> <<

  "imap <D-]> <Esc>>>i
  "imap <D-[> <Esc><<i
"
" Add rspec runner
"Bundle 'thoughtbot/vim-rspec'
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>
"let g:rspec_command = "!bundle exec rspec"

" Bundle "skwp/vim-rspec"
"


  " Start the status line
  "set statusline=%f\ %m\ %r
  "set statusline+=Line:%l/%L[%p%%]
  "set statusline+=Col:%v
  "set statusline+=Buf:#%n
  "set statusline+=[%b][0x%B]
"""""""""""""""""""""""""""""""""""""""""
" janus settings (taken from janus core/before)
"""""""""""""""""""""""""""""""""""""""""
"if has("autocmd")
  "if exists("g:autosave_on_blur")
    "au FocusLost * silent! wall
  "endif
"endif
"source $HOME/.vim/settings/filetypes.vim
"source $HOME/.vim/settings/gui_settings.vim
"source $HOME/.vim/settings/mappings.vim
"source $HOME/.vim/settings/settings.vim
"source $HOME/.vim/settings/statusline.vim

"Bundle "rgarver/Kwbd.vim"
"Bundle "petdance/ack2" (replaced by ag)
" unite for file searching
"Bundle "Shougo/unite.vim"
"nnoremap f :Unite -start-insert file
"
