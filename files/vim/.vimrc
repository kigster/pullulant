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
"colorscheme evolution
colorscheme peachpuff

set guicursor+=n-v-c:blinkon0
set guifont=Consolas:h16

filetype plugin indent on

map ,f :Ack!<cr>
map ,g y:Ack!'<C-R>0'<cr>
map \ :NERDTreeToggle<cr>
nnoremap <silent> <Space> :nohl<CR><C-l>
map ,t :Vipe bundle exec rspec <c-r>%:<c-r>=line('.')<cr><cr>
map ,y :Vipe<cr>

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
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
:augroup END
