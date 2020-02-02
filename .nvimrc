"let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.6'

set guicursor=a:blinkon101

" the line below makes using fish shell less pain
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" allow pasting to XWindow clipboard
set clipboard=unnamedplus 

" --==[ start of vim-plug section ]==-- 

" idea for autoloading vim-plug taken from: https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/ 
" download vim-plug
if empty(glob("~/.nvim/autoload/plug.vim"))
  execute ':silent !mkdir -p ~/.nvim/autoload'
  execute '!curl -fLo ~/.nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.nvim/plugged')
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'Raimondi/delimitMate'
"imap <C-c> <CR><Esc>O
"
"" better integration of vim with tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
"
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
"
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
let g:deoplete#enable_at_startup = 1

Plug 'sebastianmarkow/deoplete-rust'
let g:deoplete#sources#rust#racer_binary='/home/emgieha/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/emgieha/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'  
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20

Plug 'rust-lang/rust.vim'
let g:autofmt_autosave = 1

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<C

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
"nmap <F8> :TagbarToggle<CR>
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
map <C-m> :Explore<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
"Plug 'https://git::@github.com/SirVer/ultisnips.git'
"Plug 'honza/vim-snippets'
"Plug 'mileszs/ack.vim'

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
map <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
"
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"
"" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
"Plug 'easymotion/vim-easymotion'
Plug 'junegunn/rainbow_parentheses.vim'
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END"

"" Go 
"Plug 'Blackrush/vim-gocode'
"
"" JavaScript 
"Plug 'marijnh/tern_for_vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
"let g:vim_json_syntax_conceal = 0
"Plug 'Quramy/tsuquyomi'
"Plug 'leafgarland/typescript-vim'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"
"" HTML
"Plug 'mattn/emmet-vim'
"Plug 'tpope/vim-ragtag'
"Plug 'gorodinskiy/vim-coloresque'

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
