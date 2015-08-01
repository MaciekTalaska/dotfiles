set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" --==[ start of vim-plug section ]==-- 

" idea for autoloading vim-plug taken from: https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/ 
" download vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute ':silent !mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
imap <C-c> <CR><Esc>O

Plug 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
	
Plug 'marijnh/tern_for_vim'
Plug 'bling/vim-airline'
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16'
set laststatus=2

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
Plug 'SirVer/ultisnips'

" Go 
Plug 'Blackrush/vim-gocode'

" JavaScript 
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

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
