" the line below makes using fish shell less pain
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" allow pasting to XWindow clipboard
set clipboard=unnamedplus 

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

" --==[ start of vim-plug section ]==-- 

" idea for autoloading vim-plug taken from: https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/ 
" download vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute ':silent !mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'wincent/command-t'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
imap <C-c> <CR><Esc>O

" better integration of vim with tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'L9'
Plug 'FuzzyFinder' "relies on L9 to be installed
Plug 'PreciseJump'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF'

Plug 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim'

Plug 'marijnh/tern_for_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16'
set laststatus=2
Plug 'edkolev/tmuxline.vim'

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'https://git::@github.com/SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
:set hidden  " required by lusty
Plug 'sjbach/lusty'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'

" Markdown
Plug 'suan/vim-instant-markdown'

" Go 
Plug 'Blackrush/vim-gocode'

" JavaScript 
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" HTML
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-ragtag'
Plug 'gorodinskiy/vim-coloresque'

" Rust 
" Plug 'phildawes/racer' 
call plug#end()

" --==[ end of vim-plug section ]==--

filetype on
set relativenumber
set number
set numberwidth=3
syntax on 
set t_Co=256
set background=light
colorscheme solarized

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set cursorline
set wildmenu            " vim's menu for files etc.
set showmatch           " show matchin braces of all types

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set pastetoggle=<F2>

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <C-g> :call NumberToggle()<cr>

:au Bufleave * :set nornu 
:au BufEnter * :set relativenumber

autocmd InsertEnter * :set nornu 
autocmd InsertLeave * :set relativenumber

nmap ,d :b#<bar>bd#<CR> " use ,d to delete buffer while in splitmode, and switch to last used buffer
