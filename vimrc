set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" auto jump to previous position after you open a file
" or you can just type keys: '"
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set number                                                        " show line numbers
" jump to the matched bracket, type: %
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set smarttab
set expandtab       " expand tab to space
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "

set wrap
set textwidth=0 wrapmargin=0
set formatoptions-=tc

autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

syntax enable
let mapleader=','

set undodir=~/.vim/undodir
set undofile
"set undolevels = 1000
"set undoreload = 10000

if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'altercation/vim-colors-solarized'

" Need follow the README:
" 1. install 7.3+: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
" 2. Build the plugin: https://github.com/Valloric/YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe'


" NERDTree
NeoBundle 'scrooloose/NERDTree'
" autocmd vimenter * NERDTree
" troggle nerdtree by ctrl-n
map <silent> <F11> :NERDTreeToggle<CR>
" auto close if only the tree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']


" syntastic
" https://github.com/scrooloose/syntastic
" can use pylint.
NeoBundle 'scrooloose/syntastic'

" NERDCommenter
" type: ,cc
NeoBundle 'scrooloose/NERDCommenter'
" ctrl+/ not work.
"nmap <C-n> :NERDComToggleComment<CR>
autocmd BufWinLeave * call clearmatches()

" taglist
" you need run 'ctags -R' in your project.
NeoBundle 'taglist.vim'
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow=1
set tags=tags,./tags
map <silent> <F12> :TlistToggle<cr>

"" Ultisnips
" Conflict with ycm:
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-e>"
NeoBundle 'honza/vim-snippets'


" https://github.com/tpope/vim-fugitive
NeoBundle 'tpope/vim-fugitive'


" gundo
NeoBundle 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>


" vim-airline
" https://github.com/bling/vim-airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Color scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
