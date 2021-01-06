" .vimrc - jalopezsilva@gmail.com
" -------------------------------

" == Init == {{{

" Sources a file if it exists.
function! SourceFile(filePath)
  if !empty(glob(a:filePath))
    execute 'source' . fnameescape(a:filePath)
  endif
endfunction

" Loads Plugins using the file and directory specified.
function! PluginInit(filePath, pluginDir)
  call plug#begin(a:pluginDir)
  call SourceFile(a:filePath)
  call plug#end()
endfunction

" Bundlebag file.
let g:PluginsDefPath = "~/.vim/plugins.vim"
let g:PluginDir = "~/.vim/plugged"

" External non-versioned init file (optional).
let g:ExternalInitPath = "~/.vim/externalinit.vim"

" Preload configuration file (optional)
let g:PreloadInitPath = "~/.vim/preload.vim"

" Initialize Plugins
set nocompatible
filetype off
call SourceFile(g:PreloadInitPath)
call PluginInit(g:PluginsDefPath, g:PluginDir)
call SourceFile(g:ExternalInitPath)
filetype plugin indent on
syntax on

" }}}

" == Basic Settings == {{{

set number                     " Number lines.

set expandtab                  " Tab equals spaces.

set tabstop=2                  " Defines size of a tab in spaces.
set softtabstop=2              " Spaces to delete when deleting a tab.
set shiftwidth=2               " Spaces to use while indenting.
set shiftround                 " Use shiftwidth multiples when '>' or '<'

set nowrap                     " No wrapping of horizontal lines.

set showcmd                    " Display incomplete commands

set showmatch                  " Display matching brackets.

set cmdheight=2                " Sets the height of the cmd in lines.

set clipboard=unnamed          " Uses the system's clipboard.

set incsearch                  " Search as you type.
set hlsearch                   " Highlights search matches.

set ignorecase                 " Ignore case while searching.

set listchars+=eol:¬           " Expand listchars to show <EOL>.

if has('mouse')
  set mouse=a                  " Enables use of mouse (all modes).
endif

if has("mouse_sgr")            " Fixes use of mouse on right most buffer.
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

set pastetoggle=<F2>           " Paste toggle.

set hidden                     " Allow hidden buffers.

set fileformat=unix            " Define <EOL>

set undolevels=1000            " Remember my changes.

set wildignore+=*.swp,*.bak,   " Do not auto-complete these files.
set wildignore+=*.class,*.pyc
set wildignore+=*/node_modules/*

set breakindent                " Wrapped lines should be indented.
set showbreak=↪                " Visual lines indicator.

set nobackup                   " Disable backing of files
set nowritebackup

set noswapfile                 " Disable use of swap file.

set wildmode=longest:full,full " Longest common string, start wild menu.

set nostartofline              " Disables startofline option

set smartindent                " Indent, Indent, Indent

set cursorline                 " Highlight the current line.
set colorcolumn=81             " Shows the current column.

set cm=blowfish2               " Crypt method.

set lazyredraw                 " Don't redraw on macro execution.

set splitbelow                 " Opening new buffers to the right or below.
set splitright

set undofile                   " Undo forever.
set undodir=~/.vim/undodir

set updatetime=300             " Down from 4 seconds for CursorHold.

set shortmess+=c               " Don't pass messages to |ins-completion-menu|.

set signcolumn=yes             " Keep a left column for signals.

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

" Edit plugins definition.
nnoremap <leader>ep :execute "vsplit " . fnameescape(g:PluginsDefPath)<CR>

" Extend in<> movement to line-wise operation.
onoremap in( :<c-u>normal! 0f(vi(<cr>
onoremap in{ :<c-u>normal! 0f{vi{<cr>
onoremap in[ :<c-u>normal! 0f[vi[<cr>

" Consistent end-of-line behavior.
nnoremap Y y$

" Home row escaping.
inoremap jk <esc>
inoremap kj <esc>

" Easier pane navigation.
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

" Search Web.
noremap <leader>ww :Google<CR>

" Search for highlighted.
vnoremap <expr> <leader>* 'y/\V'.escape(@",'\').'<CR>'

" Search for word under cursor
nnoremap <leader>rg :Rg <C-R><C-W><CR>

" Easy saving, quitting.
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>

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
  autocmd FileType java nnoremap <buffer> <leader>jd :JavaDocComment<CR>
  autocmd FileType java nnoremap <buffer> <leader>jft :JavaFindTest<CR>
  autocmd FileType java nnoremap <buffer> <leader>ji :JavaImport<CR>
  autocmd FileType java nnoremap <buffer> <leader>jm :JavaImpl<CR>
  autocmd FileType java nnoremap <buffer> <leader>jt :JUnit<CR>
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

augroup filetype_hg
  autocmd!
  autocmd FileType hgcommit setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType hgcommit setlocal spell
augroup END

" }}}

" == Plugin Settings == {{{

" FZF - Buffer and file management.
nnoremap <leader>bs :Buffers<CR>
nnoremap <C-P> :Files<CR>

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

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'cpp': ['clang-format'],
      \   'rust': ['rustfmt'],
      \}

highlight ALEWarning ctermbg=236
highlight ALEError ctermbg=240

" Easy Align
" Start interactive EasyAlign in visual mode.
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object.
nmap ga <Plug>(EasyAlign)"

" coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Mappings for CoCList
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Snippet support
imap <C-s> <Plug>(coc-snippets-expand)
" }}}
