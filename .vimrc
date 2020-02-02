" the line below makes using fish shell less pain
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" allow pasting to XWindow clipboard
set clipboard=unnamedplus 
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.styl set filetype=less

" wrap lines in `vimdiff` mode
" https://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" --==[ start of vim-plug section ]==-- 

" idea for autoloading vim-plug taken from: https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/ 
" download vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute ':silent !mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
imap <C-c> <CR><Esc>O

" better integration of vim with tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

nmap .b :Buffer<CR>
nmap .f :Files<CR>
nmap .t :Tags<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" TODO: remove
"nmap ,f :LeaderfFile<CR>
"nmap ,b :LeaderfBuffer<CR>
"nmap ,t :LeaderfTag<CR>
"Plug 'Yggdroot/LeaderF'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16'
set laststatus=2
Plug 'edkolev/tmuxline.vim'

"Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'https://git::@github.com/SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
Plug 'easymotion/vim-easymotion'

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" HTML
"Plug 'mattn/emmet-vim'

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

" use sudow to write a file as root when forgot to open it using sudo
cnoremap sudow w !sudo tee % >/dev/null
