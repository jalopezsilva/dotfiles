" .vimrc - jalopezsilva@gmail.com
" -------------------------------

" == Init == {{{

" Sources a file if it exists.
function! SourceFile(filePath)
  if !empty(glob(a:filePath))
    execute 'source' . fnameescape(a:filePath)
  endif
endfunction

" Loads Vundle using the file provided as argument.
function! VundleInit(filePath)
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  call SourceFile(a:filePath)
  call vundle#end()
endfunction

" Bundlebag file.
let g:BundleBagPath = "~/.vim/bundlebag.vim"

" External non-versioned init file (optional).
let g:ExternalInitPath = "~/.vim/externalinit.vim"


" Initialize Vundle
set nocompatible
filetype off
call VundleInit(g:BundleBagPath)
call SourceFile(g:ExternalInitPath)
filetype plugin indent on
syntax on

" }}}

" == Basic Settings == {{{

set number                       " Number lines.

set expandtab                    " Tab equals spaces.

set tabstop=2                    " Defines size of a tab in spaces.
set softtabstop=2                " Spaces to delete when deleting a tab.
set shiftwidth=2                 " Spaces to use while indenting.
set shiftround                   " Use shiftwidth multiples when '>' or '<'

set nowrap                       " No wrapping of horizontal lines.

set showcmd                      " Display incomplete commands

set showmatch                    " Display matching brackets.

set cmdheight=2                  " Sets the height of the cmd in lines.

set clipboard=unnamed            " Uses the system's clipboard.

set incsearch                    " Search as you type.
set hlsearch                     " Highlights search matches.

set ignorecase                   " Ignore case while searching.

set listchars+=eol:¬             " Expand listchars to show <EOL>.

if has('mouse')
  set mouse=a                    " Enables use of mouse (all modes).
endif

set pastetoggle=<F2>             " Paste toggle.

set hidden                       " Allow hidden buffers.

set fileformat=unix              " Define <EOL>

set undolevels=1000              " Remember my changes.

set wildignore+=*.swp,*.bak,     " Do not auto-complete these files.
set wildignore+=*.class,*.pyc
set wildignore+=*/node_modules/*

set breakindent                  " Wrapped lines should be indented.
set showbreak=↪                  " Visual lines indicator.

set nobackup                     " Disable backing of files

set noswapfile                   " Disable use of swap file.

set wildmode=longest:full,full   " Longest common string, start wild menu.

set nostartofline                " Disables startofline option

set smartindent                  " Indent, Indent, Indent

set cursorline                   " Highlight the current line.
set colorcolumn=81               " Shows the current column.

set cm=blowfish2                 " Crypt method.

set lazyredraw                   " Don't redraw on macro execution.

set splitbelow                   " Opening new buffers to the right or below.
set splitright

set undofile                     " Undo forever.
set undodir=~/.vim/undodir

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background     " base16 colorscheme
endif

" }}}

" == Regular Mappings == {{{

" Leader definition.
let mapleader =","

" Local Leader definition.
let maplocalleader ="\\"

" Edit and source my VIMRC.
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Clear search.
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Remove trailing white spaces.
nnoremap <Leader>rtw :%s/\s\+$//e<CR><C-O>:let @/=""<CR>

" Toggle fold.
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Use very magic search.
nnoremap / /\v
cnoremap %s/ %s/\v
cnoremap >s/ >s/\v

" Useful for forcing sudo.
cnoremap w!! w !sudo tee > /dev/null %

" Edit bundlebag.
nnoremap <leader>ebb :execute "vsplit " . fnameescape(g:BundleBagPath)<CR>

" Extend in<> movement to line-wise operation.
onoremap in( :<c-u>normal! 0f(vi(<cr>
onoremap in{ :<c-u>normal! 0f{vi{<cr>
onoremap in[ :<c-u>normal! 0f[vi[<cr>

" Consistent end-of-line behavior.
nnoremap Y y$

" Home row escaping.
inoremap <esc> <nop>
inoremap jk <esc>
inoremap kj <esc>

" Easier pane navigation.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Disable use of arrows.
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" No, never.
nnoremap Q <Nop>

" Quickfix.
nnoremap <leader>cq :cclose<CR>

" }}}

" == FileType Specific Mappings == {{{

" Correct spelling on gitcommit.
autocmd FileType gitcommit setlocal spell

" HTML files.
augroup filetype_html
  autocmd!
  autocmd FileType html :iabbrev <buffer> & &amp;
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  autocmd FileType html nnoremap <buffer> <F5> :!open %<CR>
  let g:html_indent_inctags = "html,body,head,tbody"
augroup END

" Markdown files.
augroup markdown_group
  autocmd!
  let g:vim_markdown_folding_disabled=1
augroup END

" vim filetype.
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" java filetype.
augroup filetype_java
  autocmd!
  autocmd FileType java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
augroup END

" python filetype.
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80
  autocmd FileType python nnoremap <buffer> <F5> :!clear; python %<CR>
  autocmd FileType python setlocal nosmartindent
augroup END

" php filetype.
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal foldmethod=syntax foldlevel=1 foldnestmax=2 foldcolumn=3
  let php_folding = 1
  let php_sql_query = 1
  let g:PHP_vintage_case_default_indent = 1
  let g:PHP_outdentphpescape = 1
augroup END

" js filetype.
augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax foldlevel=0 foldnestmax=1 foldcolumn=4
augroup END

" make filetype.
augroup filetype_make
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

" }}}

" == Plugin Settings == {{{

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep' " Use ag if available.
endif


" CtrlP - Buffer and file management.
nnoremap <leader>bs :CtrlPBuffer<CR> let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|env$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" SparkUp - Easy editing of HTML.
let g:sparkupNextMapping = '<c-y>'

" Vim Airline.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" TmuxLine
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#F',
      \'c'    : '',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#{battery_percentage}',
      \'y'    : ['%b %d',  '%R'],
      \'z'    : '#h'}

" Syntastic
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
let g:syntastic_php_checkers = ['php']

" Gundo - Undo tree visualized.
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" Goyo
function! s:goyo_enter()
  call NumbersDisable()
  silent !tmux set status off
endfunction

function! s:goyo_leave()
  call NumbersEnable()
  silent !tmux set status on
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Syntastic
let g:pymode_lint_cwindow = 0

" UtilSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" }}}
