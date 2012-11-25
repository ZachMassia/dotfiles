call pathogen#infect()

" No-brainer options
filetype plugin on
filetype plugin indent on
set nocompatible
syntax on

" Mouse compatibility
set mouse=a

" Line numbers
set number

" Solarized
syntax enable
set background=dark
colorscheme  solarized


"NERDTree toggle
map <F2> :NERDTreeToggle<CR>

" Tab settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

" Code folding
set foldmethod=indent
set foldlevel=99

" Window navigation using Ctrl + hjkl
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Task list
map <leader>td <Plug>TaskList

" Visual undo
map <leader>g :GundoToggle<CR>

" Don't use quickfix window for pyflakes
let g:pyflakes_use_quickfix = 0

" PEP8 violation toggle
let g:peg8_map='<leader>8'

" SuperTab options
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Ropevim bindings
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Ack binding
" The '!' at the end is so it does not open the first file
nmap <leader>a <Esc>:Ack!

" Arduino syntax
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
