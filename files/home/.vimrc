syntax on

set autoindent
set autoread
set background=dark
set encoding=utf8
set expandtab 
set hlsearch
set ignorecase
set laststatus=2
set magic
set mat=2
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowb
set shiftwidth=2
set smartindent
set softtabstop=2

map <C-S-L> * exe mzgg=G`z
map ,l * exe mzgg=G`z
if has ("autocmd")
  filetype indent on
endif

set t_Co=256 

colorscheme slate
"colorscheme peachpuff
colorscheme evolution

set guicursor+=n-v-c:blinkon0
set guifont=Consolas:h16

filetype plugin indent on

map ,a :ChefFindAny<cr>
map ,t :ChefFindAttribute<cr>
map ,r :ChefFindRecipe<cr>
map ,d :ChefFindDefinition<cr> 
map ,w :ChefFindLWRP<cr>
map ,s :ChefFindSource<cr>
map ,r :ChefFindRelated<cr>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" set *.hamlc files to haml syntax
:autocmd BufRead,BufNewFile *.json setfiletype json
:autocmd BufRead,BufNewFile *.nmap setfiletype nmap
:autocmd BufRead,BufNewFile *.hamlc setfiletype haml

:autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
:autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
"
" 1 = horizontal, 2 = vertical, 3 = new tab, 4 = previous window
"
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
