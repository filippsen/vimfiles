let s:IsUbuntu = -1
if (match(system("cat /etc/issue"), "Ubuntu") != -1)
    let s:IsUbuntu=1
else
    let s:IsUbuntu=0
endif

" General
set nocompatible
set noswapfile                  " Do not want swap and backups
set nobackup                    " 
set history=100
set undolevels=1000
set noerrorbells visualbell t_vb=
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
if (s:IsUbuntu)
    let g:clang_use_library=1
    let g:clang_library_path = '/usr/local/lib/'
    let g:clang_auto_select=1
    let g:clang_close_preview=1
    let g:clang_user_options = '-std=c++11 -stdlib=libc++'
    let g:clang_jumpto_declaration_key='<C-]>'
    let g:clang_jumpto_back_key='<C-T>'
    set conceallevel=2
    set concealcursor=inv
    let g:clang_snippets=1
    let g:clang_conceal_snippets=1
    let g:clang_snippets_engine='clang_complete'
    set completeopt=menu,menuone
    set pumheight=20
    let g:clang_trailing_placeholder=1
    let g:clang_sort_algo='alpha'
else
    Bundle 'Valloric/YouCompleteMe'
endif

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
nnoremap <F6> :make clean; make<CR>

" Syntax validation
if (s:IsUbuntu)
    " Regular syntastic
    nnoremap <F7> :SyntasticCheck<CR>
else
    " Syntastic via YCM keybindings
    nnoremap <F7> :YcmForceCompileAndDiagnostics<CR>
endif

" NERDTree keybindings
nnoremap <F4> :NERDTreeTabsToggle<CR>

" Search keybindings
nnoremap <F3> :grep --include=*.{c,cpp,h} -nRHI "

" clang-format keybindings
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>
imap <C-K> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>i

" Close scratch area after completion is done
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Disable expand tab for working with Makefiles
autocmd FileType make setlocal noexpandtab

