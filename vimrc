" .vimrc - jalopezsilva@gmail.com
" ---------------------

" == Basic Settings == {{{

set nocompatible                 "  Set nocompatible to use ViM features instead of plain VI
set number                       "  Number lines.
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
set clipboard=unnamed            "   Uses the system's clipboard.

set hlsearch                     "  Highlights search matches.
set incsearch                    "  Searching as you type.
set ignorecase                   "  Ignore case while searching.

if has('mouse')
  set mouse=a                      "  Enables use of mouse
endif

set autoindent                   "  Indent files automatically.
set smartindent
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

colorscheme bubblegum

set nobackup                     "  Disable backing of files
set noswapfile                   "  Disable use of swap file.

set wildmenu                     "  Enable tab completion on commands
set wildmode=list:full           "  Complete first full match.
set novisualbell                   " Disables Visual Bell
set noerrorbells
set t_vb =
set nostartofline                " Disables startofline option
set tags=tags;/                  " Search upwards for a tags file until the root folder.

syntax on
filetype plugin indent on

" }}}

" == Plugin Settings == {{{
                                 "  Pathogen
execute pathogen#infect()
call pathogen#helptags()
                                 " Bufferline
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0
                                " Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10

" }}}

" == Mappings == {{{
let mapleader =","
let maplocalleader ="\\"
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
nnoremap <leader>pbr :execute "rightbelow vsplit " . bufname("#")<CR>
nnoremap <leader>a; :execute "normal! mqA;<Bslash><lt>ESC>`q"<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR><C-O>:let @/=""<CR>
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
onoremap in( :<c-u>normal! 0f(vi(<cr>
onoremap in{ :<c-u>normal! 0f{vi{<cr>
onoremap in[ :<c-u>normal! 0f[vi[<cr>
nnoremap / /\v
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprevious<CR>

" }}}

" == FileType Specific Mappings == {{{
"
                                  " Autocommands
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#CompleteTags

autocmd FileType gitcommit setlocal spell
augroup html_group
  autocmd!
  autocmd FileType html :iabbrev <buffer> & &amp;
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

" Drupal *.module and *.install files.
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
augroup END

augroup markdown_group
  autocmd!
                                   " Inside Heading
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^\\(--\\+\\\|==\\+\\)$\r:nohlsearch\rkvg_"<CR>
                                   " Around Heading
  autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^\\(--\\+\\\|==\\+\\)$\r:nohlsearch\rg_vk0"<CR>
                                   " Email Addresses
  autocmd FileType markdown onoremap in@ :<c-u>execute "normal! /\\(\\w\\\|\\.\\)\\+@\\w\\+.\\w\\+\r:nohlsearch\rviW"<CR>
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
