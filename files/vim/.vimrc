:syntax on
:set autoindent
:set expandtab
:set softtabstop=2
:set shiftwidth=2
:set ignorecase
:set hlsearch
:set magic
:set noerrorbells
:set novisualbell
:set mat=2
:set encoding=utf8
:set nobackup
:set nowb
:set noswapfile
:set laststatus=2
:set autoread
:set background=dark

set t_Co=256
colorscheme evolution

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
