:syntax on
:set autoindent
:set expandtab
:set softtabstop=2
:set shiftwidth=2
:autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
:autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
