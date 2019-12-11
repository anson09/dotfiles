"vim-plug
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'chr4/nginx.vim'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'chemzqm/mycomment.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

" Custom
set number
color nord
set showcmd
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set wildmenu
set wildmode=longest:list,full
set updatetime=250

"nerdtree
nnoremap <Leader>f :NERDTreeToggle<Enter>
