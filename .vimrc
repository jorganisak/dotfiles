" Use the Solarized Dark theme
set background=dark
"set background=light
colorscheme solarized
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

:nnoremap K i<CR><Esc>
let g:bufferline_echo = 1
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
"let g:tmuxline_preset = 'crosshair'
"let g:tmuxline_preset = 'full'
let g:tmuxline_preset = 'nightly_fox'
"let g:tmuxline_preset = 'tmux'
"let g:tmuxline_preset = 'powerline'
"
"PYMODE STUFF
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint','mccabe']
let g:pymode_rope = 0

let g:jsx_ext_required = 0
if $TMUX == ''
	set clipboard+=unnamed
endif

autocmd User Node
			\ if &filetype == "javascript" |
			\   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
			\   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
			\ endif

set autoindent
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100

" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set omnifunc=syntaxcomplete#Complete

let NERDTreeIgnore = ['\.pyc$']
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

set display+=lastline

set autoread

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype off
" Init pathogen "
execute pathogen#infect()
call pathogen#helptags()
" remap semicolon "
noremap ; :
" Automatically close vim if only NERDTree is open "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree shortcut "
map <C-n> :NERDTreeToggle<CR>
" CTRL P things "
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"set relativenumber
"au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	filetype plugin indent on
	filetype plugin on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
"
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Switch between the last two files
nnoremap <leader><leader> <c-^>

autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <Leader>a :bp<CR>
map <Leader>f :bn<CR>

let g:go_disable_autoinstall = 1
