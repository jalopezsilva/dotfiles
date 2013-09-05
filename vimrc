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
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>l :set list!<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0 

