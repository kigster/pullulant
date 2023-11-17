" vim: ft=vim

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

"map <C-S-L> * exe mzgg=G`z
"map <C-S-L> * exe mzgg=G`z
"map ,l * exe mzgg=G`z

if has ("autocmd")
  filetype indent on
endif

"set guicursor+=n-v-c:blinkon0

filetype plugin indent on
:filetype plugin on

map \ :NERDTreeToggle<cr>

map ,t q:Vipe bundle exec rspec <c-r>%:<c-r>=line('.')<cr><cr>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" set *.hamlc files to haml syntax
:autocmd BufRead,BufNewFile *.itermcolors setfiletype xml
:autocmd BufRead,BufNewFile *.json setfiletype json
:autocmd BufRead,BufNewFile *.nmap setfiletype nmap
:autocmd BufRead,BufNewFile *.hamlc setfiletype haml
:autocmd BufRead,BufNewFile *.html setfiletype html
:autocmd BufRead,BufNewFile *.css setfiletype css
:autocmd BufRead,BufNewFile zone* setfiletype bind
:autocmd BufRead,BufNewFile *.zone setfiletype bind

:autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
:autocmd BufNewFile,BufReadPost zone*,*.zone set filetype=bind
:autocmd BufNewFile,BufReadPost *.itermcolors set filetype=xml
:autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
:autocmd BufNewFile,BufReadPost *.sh,*.bash,*.bats set filetype=sh
:autocmd BufNewFile,BufReadPost *.yaml,*.yml set filetype=yaml
:autocmd BufNewFile,BufReadPost *.html set filetype=html
:autocmd BufNewFile,BufReadPost *.sql set filetype=sql
:autocmd BufNewFile,BufReadPost *.haml set filetype=haml
:autocmd BufNewFile,BufReadPost *.rb,*.rake,*.cap,Procfile*,Rakefile,Capfile,Gemfile,*.gemspec,*.tpl set filetype=ruby
:autocmd BufNewFile,BufReadPost *.conf set filetype=nginx

"
" 1 = horizontal, 2 = vertical, 3 = new tab, 4 = previous window
"
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Auto-install Plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bazelbuild/vim-bazel'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/Colorizer'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'gisphm/vim-gitignore'
Plug 'google/vim-maktaba'
Plug 'habamax/vim-asciidoctor'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'pangloss/vim-javascript'
Plug 'phanviet/vim-monokai-pro'
Plug 'psliwka/vim-smoothie'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rhysd/vim-syntax-codeowners'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/vim-shebang'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'

call plug#end()

try
  source ~/.vimrc.customizations
catch
  " No such file? No problem; just ignore it.
endtry
