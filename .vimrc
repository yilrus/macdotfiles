" Centers cursor vertically.
set so=999
" Disables retarded os defaults
set nocompatible

" Yay this isn't a shitty editor any more
filetype indent plugin on
syntax on

set wildmenu
set showcmd
set ignorecase
set smartcase
set autoindent
set backspace=indent,eol,start
set nostartofline
set ruler
" Disabled because it doesn't work with Powerline. If not using powerline,
" turn on and make sure to use laststatus=2 as well
"set cmdheight=2
set laststatus=2
set confirm
set mouse=a
set shiftwidth=4
set softtabstop=4
set expandtab


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

