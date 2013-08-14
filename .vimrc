" General
set nocompatible
set noswapfile                  " Do not want swap and backups
set nobackup                    " 
set history=100
set undolevels=1000
set noerrorbells
set lazyredraw

" Color theme and syntax hightlighting
syntax enable                   " Syntax highlighting
set t_Co=256                    " Color set
set background=dark

" UI
set hlsearch                    " Highlight search results
set incsearch                   " Search as you type
set ignorecase                  " ignore case sensitivity...
set smartcase                   " ... unless CapitalCases
set linespace=0
set fillchars=""
set cursorline                  " Highlight cursor line
set backspace=indent,eol,start  " Work as intended
set ruler                       " Always show
set showmatch                   " Show matching brackets
set number
set showcmd                     " Show cmd in status bar
set showmode
set wildmenu

" Text options
set encoding=utf-8
set nowrap                      " Don't wrap lines
set autoindent                  " 
set smartindent                 " 
set expandtab                   " Use spaces
set smarttab                    "  
set tabstop=4                   "  
set shiftwidth=4                "  
set softtabstop=4               " 
set foldmethod=indent           " enable folding
set foldlevelstart=42           " folds open when start


" Tab keybindings
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Up> :tabnew<CR>
nnoremap <silent> <C-Down> :tabclose<CR>

" Folding keybindgins
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" clang_complete plugin
let g:clang_complete_auto = 1
let g:clang_use_library = 1 
let g:clang_debug = 1
let g:clang_hl_errors = 1

" Close scratch area after completion is done
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Disable expand tab for working with Makefiles
autocmd FileType make setlocal noexpandtab
