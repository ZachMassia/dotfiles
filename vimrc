call pathogen#infect()

" No-brainer options
filetype plugin on
filetype plugin indent on
set nocompatible
syntax on

" Remap esc
:imap jj <Esc>

" Mouse compatibility
set mouse=a

" Line numbers
set number

" Solarized
syntax enable
"set background=dark
"colorscheme  solarized


"NERDTree toggle
map <F2> :NERDTreeToggle<CR>

" Tab settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

" Ruby settings
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

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

" SuperTab options
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Arduino syntax
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
" Processing syntax
autocmd! BufNewFile,BufRead *.pde setlocal ft=processing
"Kivy syntax
autocmd! BufNewFile,BufRead *.kv setlocal ft=kivy
" SConstruct syntax
autocmd! BufNewFile,BufRead SConstruct setlocal ft=python

" Rsense autocomplete
let g:rsenseUseOmniFunc = 1

" Clang_complete
let g:clang_user_options = '|| exit 0'
let g:clang_close_preview = 1
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm"
