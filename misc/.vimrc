set tabstop=4
set shiftwidth=4
set smarttab
set ai
set cin
set showmatch
set incsearch
set ignorecase
set number
set relativenumber
set noswapfile
set termguicolors

colorscheme wildcharm
set background=dark
syntax on

let mapleader=" "
map - :Ex<CR>
map ]q :cnext<CR>
map [q :cprev<CR>
map ]b :bn<CR>
map [b :bp<CR>
map <leader>b :ls<CR>:b
map <leader>co :copen<CR>
map <leader>cc :cclose<CR>
