" pathogen addon manager (https://github.com/tpope/vim-pathogen)
call pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()

syntax enable
set t_Co=256
set background=light
let g:solarized_termcolors=256
colorscheme solarized
call togglebg#map("<F5>")

set nocompatible                " choose no compatibility with legacy vi
set number
nnoremap <F7> :set nonumber!<CR>
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" enable mouse
set mouse=a

" Whitespace
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
" set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" bindings
set pastetoggle=<F12>
set nowrap
map <F10> :set nowrap!<CR>
nmap <F6> a<C-R>=strftime("%Y-%m-%d %a %R")<CR><Esc>
imap <F6> <C-R>=strftime("%Y-%m-%d %a %R")<CR>

" NERDTree
map <F11> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right" 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" write backup, swap and undo files to ~/.vimswap
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp


