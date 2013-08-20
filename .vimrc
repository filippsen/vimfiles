
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
if !has('gui_running')
    set t_Co=256                    " Color set
    set background=dark
endif

" UI
set cmdheight=2                 " Better for long messages
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
set laststatus =2                " Status line
set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ 
set statusline+=%{getcwd()}
set statusline+=%=\[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ 
set statusline+=Line:%l\/%L\ Column:%c%V\ %=\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

"Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles:
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

filetype plugin indent on

" Tab keybindings
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Up> :tabnew<CR>
nnoremap <silent> <C-Down> :tabclose<CR>

" Folding keybindgins
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Make keybindings
nnoremap <F5> :!make run<CR>

" YCM keybindings
nnoremap <F7> :YcmForceCompileAndDiagnostics<CR>

" NERDTree keybindings
nnoremap <F4> :NERDTreeTabsToggle<CR>

" Close scratch area after completion is done
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Disable expand tab for working with Makefiles
autocmd FileType make setlocal noexpandtab

