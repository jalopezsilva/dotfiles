" .vimrc - jalopezsilva@gmail.com
" -------------------------------

" == Vundle == {{{
function! VundleInit()
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  execute 'source' . fnameescape(g:BundleBagPath)
  call vundle#end()
endfunction
" }}}

" == Initialize == {{{
let g:BundleBagPath="~/.vim/bundlebag.vim"
set nocompatible
filetype off
call VundleInit()
filetype plugin indent on
syntax on
" }}}

" == Basic Settings == {{{
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

set pastetoggle=<F2>             "  Use F2 to insert data without indentation.

set termencoding=utf-8           "  Encoding
set encoding=utf-8
set hidden
set fileformat=unix
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/node_modules/*
set title
set listchars=tab:▸\ ,eol:¬       " Defines how to display tab and eol characters.
set showbreak=↪

colorscheme Tomorrow-Night

set nobackup                     "  Disable backing of files
set noswapfile                   "  Disable use of swap file.

set wildmenu                     "  Enable tab completion on commands
set wildmode=list:full           "  Complete first full match.
set vb noerrorbells t_vb=        " Be silent!
set nostartofline                " Disables startofline option
set tags=./.tags

set laststatus=2                 " Always show status lines.

set smartindent                  " Indent, Indent, Indent
set cursorline                   " Highlight the current line.

" }}}

" == Regular Mappings == {{{
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
cnoremap %s/ %s/\v
cnoremap >s/ >s/\v
nnoremap <leader>ebb :execute "vsplit " . fnameescape(g:BundleBagPath)<CR>

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

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax foldlevel=0 foldnestmax=1 foldcolumn=4
augroup END

augroup filetype_make
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

" }}}

" == Plugin Settings == {{{

" CtrlP
nnoremap <leader>bs :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|env$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" SparkUp
let g:sparkupNextMapping = '<c-y>'

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" TmuxLine
" let g:tmuxline_preset = 'full'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#F',
      \'c'    : '',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#{battery_percentage}',
      \'y'    : ['%b %d',  '%R'],
      \'z'    : '#h'}
"
" Syntastic
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
let g:syntastic_php_checkers = ['php']


" Indent HTML
let g:html_indent_inctags = "html,body,head,tbody"

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Gundo
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom = 1

"" DelimitMate
let delimitMate_matchpairs = "(:),[:],{:}"

"" Startify
let g:startify_custom_header =
      \ map(split(system('fortune -s | cowsay -f moose'), '\n'), '"   ". v:val') + ['','']

"" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
      \ 'i:interfaces',
      \ 'c:classes',
      \ 'd:constant definitions',
      \ 'f:functions',
      \ 'j:javascript functions:1'
  \ ]
\ }

let g:tagbar_type_javascript  = {
  \ 'ctagstype' : 'JavaScript',
  \ 'kinds'     : [
      \ 'v:global variables',
      \ 'c:classes',
      \ 'm:methods',
      \ 'f:functions'
  \ ]
\ }

" Easy Tags
let g:easytags_dynamic_files = 2
let g:easytags_auto_highlight = 0

" Neosnippets
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=3 concealcursor=nvi
endif

" Goyo

let g:goyo_width=120

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set nocursorline
  set textwidth=120
  call NumbersDisable()
  call NumbersRelativeOff()
  call NeoComplCacheLock()
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set cursorline
  set textwidth=80
  set showmode
  set showcmd
  call NumbersEnable()
  call NeoComplCacheUnlock()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
  " }}}
