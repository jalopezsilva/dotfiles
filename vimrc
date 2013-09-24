" .vimrc
" ---------------------
set nocompatible                 "  Set nocompatible to use ViM features instead of plain VI
set number                       "  Number lines.

filetype indent plugin on        "  Loads specific plugins and indent files based on filetype.

set expandtab                    "  Tab equals spaces.
set tabstop=2                    "  Defines size of a tab in spaces.
set softtabstop=2                "  Number of spaces to delete when deleting a tab
set shiftwidth=2                 "  Spaces to use while indenting.
set shiftround                   "  Use shiftwidth multiples when '>' or '<'
set backspace=indent,eol,start   "  Backspace over everything.

set nowrap                       "  No wrapping of horizontal lines.
set ruler                        "   Show the cursor position all the time
set showcmd                      "  Display incomplete commands
set showmatch                    "  Display matching parenthesis
set cmdheight=2                  "   Sets the height of the cmd in lines.
set clipboard=unnamedplus        "   Uses the system's clipboard.

set hlsearch                     "  Highlights search matches.
set incsearch                    "  Searching as you type.
set ignorecase                   "  Ignore case while searching.

if has('mouse')
  set mouse=a                      "  Enables use of mouse
endif

set autoindent                   "  Indent files automatically.
set copyindent                   "  Copy previous line indentation
set pastetoggle=<F2>             "  Use F2 to insert data without indentation.

set termencoding=utf-8           "  Encoding
set encoding=utf-8
set hidden
set fileformat=unix
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set listchars=tab:▸\ ,eol:¬       " Defines how to display tab and eol characters.
set showbreak=↪


syntax on
filetype plugin indent on
                                 " GUI - Options
set guioptions+=TLlRrb
set guioptions-=TLlRrb

colorscheme luna
set nobackup                     "  Disable backing of files
set noswapfile                   "  Disable use of swap file.

set wildmenu                     "  Enable tab completion on commands
set wildmode=list:full           "  Complete first full match.

                                 "  Pathogen
execute pathogen#infect()
call pathogen#helptags()

                                "  Mappings
let mapleader =","
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0

autocmd FileType gitcommit setlocal spell

