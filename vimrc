" .vimrc - jalopezsilva@gmail.com
" -------------------------------

" == Initialize == {{{
execute pathogen#infect()
call pathogen#helptags()
" }}}

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
set vb noerrorbells t_vb=        " Be silent!
set nostartofline                " Disables startofline option
set tags=tags;/                  " Search upwards for a tags file until the root folder.

set laststatus=2                 " Always show status lines.

syntax on
filetype plugin indent on

" }}}

" == Regular Mappings == {{{
let mapleader =","
let maplocalleader ="\\"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
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
nnoremap Q <Nop>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <leader>pbr :execute "rightbelow vsplit " . bufname("#")<CR>
nnoremap <leader>a; :execute "normal! mqA;<Bslash><lt>ESC>`q"<CR>
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
cnoremap w!! w !sudo tee > /dev/null %
cnoremap s/ s/\v

" }}}

" == FileType Specific Mappings == {{{
"
" Autocommands
autocmd GUIEnter * set visualbell t_vb=
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \	 setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

autocmd FileType gitcommit setlocal spell
augroup filetype_html
  autocmd!
  autocmd FileType html :iabbrev <buffer> & &amp;
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  autocmd FileType html nnoremap <buffer> <F5> :!open %<CR>
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

augroup filetype_python
  autocmd!
  autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80
  autocmd FileType python nnoremap <buffer> <F5> :!clear; python %<CR>
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal foldmethod=syntax foldlevel=1 foldnestmax=2 foldcolumn=3
    let php_folding = 1
    let php_sql_query = 1
    let g:PHP_vintage_case_default_indent = 1
    let g:PHP_outdentphpescape = 1
augroup END

" }}}

" == Plugin Settings == {{{

" Conque Shell
let g:ConqueTerm_Color = 2
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_CWInsert = 1
nnoremap <leader>osh :call conque_term#open('zsh', ['belowright split', 'resize 10']) <CR>

" SparkUp
let g:sparkupNextMapping = '<c-k>'

" Syntastic
let g:syntastic_python_checkers = ['python']
let g:syntastic_php_checkers = ['php']

" Bufferline
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0

" Indent HTML
let g:html_indent_inctags = "html,body,head,tbody"

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Gundo
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" }}}
